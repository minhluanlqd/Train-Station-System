package trainstation.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

import trainstation.help.ReservationHelp;
import trainstation.model.User;
import trainstation.model.Reservation;


@WebServlet("/reserve")
public class ReservationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ReservationHelp reservationHelp;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        reservationHelp = new ReservationHelp();
    }
	
    public ReservationServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
    	String userName = ((User) session.getAttribute("user")).getUsername();
        
        ArrayList<Reservation> myReservation = new ArrayList<Reservation>();
        
        try {
            myReservation = reservationHelp.getReservationHistory(userName);
            System.out.println(myReservation);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if(myReservation == null) {
        	request.setAttribute("message", "No Reservation found");
        	request.getRequestDispatcher("/WEB-INF/view/myReservation.jsp").forward(request,response);
        	return;
        }
//        HttpSession session = request.getSession();
//        session.setAttribute("user", user);
        request.setAttribute("myReservation", myReservation);
        request.getRequestDispatcher("/WEB-INF/view/myReservation.jsp").forward(request,response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("reservationId") != null) {
			doDelete(request, response);
			return;
		}
		
		String userName = request.getParameter("userName");
		String trainID = request.getParameter("trainId");
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        int fare = Integer.parseInt(request.getParameter("fare"));
        String departTime = request.getParameter("departTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String ticketType = request.getParameter("ticketType");
        String tripType = request.getParameter("tripType");
        String travelDate = request.getParameter("date");
        
        if(ticketType.equals("children")) {
        	fare *= 0.75;
        }
        else if(ticketType.equals("senior")) {
        	fare *= 0.65;
        }
        else if(ticketType.equals("disabled")) {
        	fare *= 0.5;
        }
        
        if(tripType.equals("roundtrip")) {
        	fare *= 2;
        }
        
        Reservation reserve = new Reservation(-1, userName, trainID, origin, destination, tripType, travelDate, departTime, arrivalTime, fare, ticketType);
        
        try {
        	reservationHelp.reservation(reserve);
        	request.setAttribute("message", "Reservation Success");
//            System.out.println(schedule);
        } catch (Exception e) {
        	request.setAttribute("message", e);
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("/WEB-INF/view/myReservation.jsp").forward(request,response);
		return;
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int reservationId = Integer.parseInt(request.getParameter("reservationId"));
		 try {
        	reservationHelp.cancelReservation(reservationId);
        	request.setAttribute("message", "Cancel Reservation Success");
//	            System.out.println(schedule);
        } catch (Exception e) {
        	request.setAttribute("message", e);
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/view/myReservation.jsp").forward(request,response);
		return;
	}
}

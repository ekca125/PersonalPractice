package jsp_hw.jdbc1;

public class ProfessorService {
	public static String validate(Professor professor) throws Exception {
		Professor dbProfessor=ProfessorDAO.findById(professor.getId());
		if(dbProfessor!=null) {
			return "이미 존재합니다.";
		}
		else {
			return null;
		}
	}
	public static String insert(Professor professor) throws Exception {
        String errorMessage = validate(professor);
        if (errorMessage != null) return errorMessage;
        ProfessorDAO.insert(professor);
        return null;
    }
}

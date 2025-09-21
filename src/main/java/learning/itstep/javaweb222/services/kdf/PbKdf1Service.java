package learning.itstep.javaweb222.services.kdf;

import com.google.inject.Inject;
import learning.itstep.javaweb222.services.hash.HashService;

public class PbKdf1Service implements KdfService {
    private final HashService hashService;
    private static final int ITERATIONCOUNT = 3;
    private static final int DKLENGTH = 32;

    @Inject
    public PbKdf1Service(HashService hashService) {
        this.hashService = hashService;
    }
    
    @Override
    public String dk(String password, String salt) {
        String t = hashService.digest(password + salt);
        // System.out.println(password + salt + " " + t);
        for(int i = 1; i < ITERATIONCOUNT; i++) {
            t = hashService.digest(t);
        }
        return t.substring(0, DKLENGTH);
    }

}

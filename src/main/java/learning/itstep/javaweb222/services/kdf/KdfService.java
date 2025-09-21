package learning.itstep.javaweb222.services.kdf;


public interface KdfService {
    String dk(String password, String salt);
}

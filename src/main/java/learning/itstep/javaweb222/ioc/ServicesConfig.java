package learning.itstep.javaweb222.ioc;

import com.google.inject.AbstractModule;
import learning.itstep.javaweb222.services.hash.HashService;
import learning.itstep.javaweb222.services.hash.Md5HashService;
import learning.itstep.javaweb222.services.kdf.KdfService;
import learning.itstep.javaweb222.services.kdf.PbKdf1Service;
import learning.itstep.javaweb222.services.timestamp.TimestampService;
import learning.itstep.javaweb222.services.timestamp.UnixSecondsTimestampService;

public class ServicesConfig extends AbstractModule {
    @Override
    protected void configure() {
        bind(KdfService.class).to(PbKdf1Service.class);
        bind(HashService.class).to(Md5HashService.class);
        bind(TimestampService.class).to(UnixSecondsTimestampService.class);
    }
}

package learning.itstep.javaweb222.services.timestamp;

import com.google.inject.Singleton;
import java.time.Instant;

@Singleton
public class UnixSecondsTimestampService implements TimestampService {

    @Override
    public long nowSeconds() {
        return Instant.now().getEpochSecond();
    }
}

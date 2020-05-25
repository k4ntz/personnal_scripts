from setproctitle import setproctitle
import datetime

class RTPT():
    """
    RemainingTimeToProcessTitle:
    class to write the remaining time to the process title, it will change the 
    title of the process after each epoch with an estimation of the remaining time.
    Use epoch_starts at the beginning of the epoch and setproctitle to set the
    process title.
    """

    def __init__(self, base_title, number_of_epochs, epoch_n=0):
        assert len(base_title) < 30
        self.base_title = "@" + base_title + "#"
        self._last_epoch_start = None
        self._epoch_n = epoch_n
        self._number_of_epochs = number_of_epochs
        setproctitle(self.base_title + "first_epoch")

    def epoch_starts(self):
        self._last_epoch_start = datetime.datetime.now()
        self._epoch_n += 1

    def setproctitle(self):
        last_epoch_duration = datetime.datetime.now() - self._last_epoch_start
        remaining_epochs = self._number_of_epochs - self._epoch_n
        remaining_time = str(last_epoch_duration * remaining_epochs).split(".")[0]
        days = remaining_time.split(" day")[0]
        rest = remaining_time.split(", ")[1]
        complete_title = self.base_title + f"{days}d:{rest}"
        setproctitle(complete_title)

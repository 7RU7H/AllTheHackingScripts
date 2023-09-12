import . . .

class Cmdline(interfaces.plugin.PluginInterface):
    @classmethod
    def get_requirements(cls):
        pass

    def run(self):
        pass

    # generator methdo is optional but separating it from the run method is useful pattern you'll
    # see in many plugins
    def generator(self, procs):
        pass



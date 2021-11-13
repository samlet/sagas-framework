import os

class Launcher(object):
    def start(self):
        os.system('just build-run')

if __name__ == '__main__':
    import fire
    fire.Fire(Launcher)




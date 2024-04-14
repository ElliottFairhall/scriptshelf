#!/bin/bash
echo "Cleaning up system..."
sudo apt-get autoremove -y && sudo apt-get autoclean -y
echo "Cleanup done!"
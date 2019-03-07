From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v4 armsoc/drivers/bus+gpio 3/5] bus: moxtet: Add sysfs and debugfs documentation
Date: Thu,  7 Mar 2019 13:52:49 +0100
Message-ID: <20190307125251.724-4-marek.behun@nic.cz>
References: <20190307125251.724-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307125251.724-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-Id: linux-gpio@vger.kernel.org

Add sysfs ABI documentation for the attribute files module_id and
module_name

Add debugfs ABI documentation for reading input from the shift registers
and reading last written output or write output to the shift registers.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 Documentation/ABI/testing/debugfs-moxtet      | 23 +++++++++++++++++++
 .../ABI/testing/sysfs-bus-moxtet-devices      | 17 ++++++++++++++
 MAINTAINERS                                   |  2 ++
 3 files changed, 42 insertions(+)
 create mode 100644 Documentation/ABI/testing/debugfs-moxtet
 create mode 100644 Documentation/ABI/testing/sysfs-bus-moxtet-devices

diff --git a/Documentation/ABI/testing/debugfs-moxtet b/Documentation/ABI/testing/debugfs-moxtet
new file mode 100644
index 000000000000..32a02e7d0f4e
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-moxtet
@@ -0,0 +1,23 @@
+What:		/sys/kernel/debug/moxtet/input
+Date:		March 2019
+KernelVersion:	5.2
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(R) Read input from the shift registers, in hexadecimal.
+		Returns N+1 bytes, where N is the number of Moxtet connected
+		modules. The first byte is from the CPU board itself.
+		Example: 101214
+			 10: CPU board with SD card
+			 12: 2 = PCIe module, 1 = IRQ not active
+			 14: 4 = Peridot module, 1 = IRQ not active
+
+What:		/sys/kernel/debug/moxtet/output
+Date:		March 2019
+KernelVersion:	5.2
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(RW) Read last written value to the shift registers, in
+		hexadecimal, or write values to the shift registers, also
+		in hexadecimal.
+		Example: 0102
+			 01: 01 was last written, or is to be written, to the
+			     first module's shift register
+			 02: the same for second module
diff --git a/Documentation/ABI/testing/sysfs-bus-moxtet-devices b/Documentation/ABI/testing/sysfs-bus-moxtet-devices
new file mode 100644
index 000000000000..3e3256b37a3c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-moxtet-devices
@@ -0,0 +1,17 @@
+What:		/sys/bus/moxtet/devices/moxtet-<name>.<addr>/module_description
+Date:		March 2019
+KernelVersion:	5.2
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(R) Moxtet module description. Format: string
+
+What:		/sys/bus/moxtet/devices/moxtet-<name>.<addr>/module_id
+Date:		March 2019
+KernelVersion:	5.2
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(R) Moxtet module ID. Format: %x
+
+What:		/sys/bus/moxtet/devices/moxtet-<name>.<addr>/module_name
+Date:		March 2019
+KernelVersion:	5.2
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(R) Moxtet module name. Format: string
diff --git a/MAINTAINERS b/MAINTAINERS
index 3f461a2d776a..43de8eaa284b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1502,6 +1502,8 @@ ARM/CZ.NIC TURRIS MOX SUPPORT
 M:	Marek Behun <marek.behun@nic.cz>
 W:	http://mox.turris.cz
 S:	Maintained
+F:	Documentation/ABI/testing/debugfs-moxtet
+F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/devicetree/bindings/bus/moxtet.txt
 F:	include/linux/moxtet.h
 F:	drivers/bus/moxtet.c
-- 
2.19.2

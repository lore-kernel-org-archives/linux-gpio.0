From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v3 bus+gpio 3/5] bus: moxtet: Add sysfs documentation
Date: Fri,  1 Mar 2019 04:58:50 +0100
Message-ID: <20190301035852.26780-4-marek.behun@nic.cz>
References: <20190301035852.26780-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301035852.26780-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-Id: linux-gpio@vger.kernel.org

Add sysfs ABI documentation for the attribute files module_id,
module_name, input_value and output_value of Moxtet devices.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 .../ABI/testing/sysfs-bus-moxtet-devices      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-moxtet-devices

diff --git a/Documentation/ABI/testing/sysfs-bus-moxtet-devices b/Documentation/ABI/testing/sysfs-bus-moxtet-devices
new file mode 100644
index 000000000000..80bae358a90c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-moxtet-devices
@@ -0,0 +1,25 @@
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
+
+What:		/sys/bus/moxtet/devices/moxtet-<name>.<addr>/input_value
+Date:		March 2019
+KernelVersion:	5.2
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(R) Read input value from module at this Moxtet address.
+		Format: %x
+
+What:		/sys/bus/moxtet/devices/moxtet-<name>.<addr>/output_value
+Date:		March 2019
+KernelVersion:	5.2
+Contact:	Marek Behún <marek.behun@nic.cz>
+Description:	(RW) Read last written value or write value to the module on
+		this Moxtet address. Format: %x
-- 
2.19.2

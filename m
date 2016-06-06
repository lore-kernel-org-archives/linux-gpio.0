From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: [RFC] qnap-tsx51: add new driver for leds and button support on
 QNAP TS-x51 series
Date: Mon, 6 Jun 2016 00:44:06 +0000
Message-ID: <20160606004406.29f016de@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/prZWcs0XRDVzDdhKoRRmhUl"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:32794 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbcFFAoK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2016 20:44:10 -0400
Received: by mail-pa0-f66.google.com with SMTP id di3so10504093pab.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jun 2016 17:44:09 -0700 (PDT)
Received: from localhost (p11140-ipngn5801hodogaya.kanagawa.ocn.ne.jp. [222.148.106.140])
        by smtp.gmail.com with ESMTPSA id w190sm22740920pfd.58.2016.06.05.17.44.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jun 2016 17:44:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTPSA id 2DC76900808
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2016 00:44:06 +0000 (GMT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

--MP_/prZWcs0XRDVzDdhKoRRmhUl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

(please keep me CC'ed in replies, I'm not getting a majordomo
subscription confirmation mail)

I own a QNAP TS-651 NAS enclosure (the 6-drives variant of the TS-x51
product family). It is a regular x86-64, and it can work with vanilla
kernel & generic distro as a replacement to vendor firmware.
ACPI tables do not declare GPIOs used to interface with the enclosure:
- two buttons for input
- one red led per disk slot (for failure events)
- USB activity led
- two-colours status led (for off/green/orange/red result)

I wrote the following platform driver, that I would like to contribute
to the kernel.

Could someone please review below patch ?
It is my first attempt at writing a module from scratch, so watch out
for naive mistakes.

I see drivers using GPIOs should use descriptors instead of gpio
number. I fail to see how I should convert this driver to use
descriptors. Or at least, I like a lot that this module has extremely
little actual code, as I would expect from something which essentially
does the same work as ACPI tables. Is it also achievable with
descriptors ?

About disk leds, there exist 2, 4, 6 and 8-drives versions of this
enclosure. I do not know how to detect which one the module is being
loaded on, so I declare all 8 leds, and userland should drive leds
which match detected drives.
For completeness, I attached udev configuration file (to have device
symlinks correctly mapping SCSI devices to slots - 6 drives version)
and "mdadm --monitor --program"-compatible led control shell script
(which depends on udev disk symlinks and led names being consistent).

Regards,
Vincent Pelletier

=46rom 8c59f4f1c4f0c69b9168979fdf130b301b1be20b Mon Sep 17 00:00:00 2001
Message-Id: <8c59f4f1c4f0c69b9168979fdf130b301b1be20b.1465170970.git.plr.vi=
ncent@gmail.com>
From: Vincent Pelletier <plr.vincent@gmail.com>
Date: Mon, 17 Aug 2015 18:50:13 +0200
Subject: qnap-tsx51: add new driver for leds and button support on QNAP TS-=
x51
 series

This adds QNAP TS-x51 driver. It exposes led and buttons present on this NAS
enclosure to userland for convenient access. Ideally, all this driver does
should be declared by ACPI, but even SuperIO GPIO pins are not.
Also, ideally this driver should check DMI strings, but OEM did not initial=
ise
any.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
---
 drivers/platform/x86/Kconfig      |   9 ++
 drivers/platform/x86/Makefile     |   1 +
 drivers/platform/x86/qnap-tsx51.c | 168 ++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 178 insertions(+)
 create mode 100644 drivers/platform/x86/qnap-tsx51.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ed2004b..4da05bc 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1001,4 +1001,13 @@ config INTEL_TELEMETRY
 	  used to get various SoC events and parameters
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
+
+config QNAP_TSX51
+	tristate "QNAP TS-x51 NAS"
+	select LEDS_GPIO
+	select KEYBOARD_GPIO_POLLED
+	select GPIO_F7188X
+	---help---
+	  This driver provides support for QNAP TS-x51 NAS enclosure
+	  leds (drive error, status, usb) and buttons.
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 448443c..e03c507 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -69,3 +69,4 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)  +=3D intel_punit_ipc.o
 obj-$(CONFIG_INTEL_TELEMETRY)	+=3D intel_telemetry_core.o \
 				   intel_telemetry_pltdrv.o \
 				   intel_telemetry_debugfs.o
+obj-$(CONFIG_QNAP_TSX51)	+=3D qnap-tsx51.o
diff --git a/drivers/platform/x86/qnap-tsx51.c b/drivers/platform/x86/qnap-=
tsx51.c
new file mode 100644
index 0000000..c6304b9
--- /dev/null
+++ b/drivers/platform/x86/qnap-tsx51.c
@@ -0,0 +1,168 @@
+/*
+ * Support for LEDs and buttons available on the QNAP TS-x51 NAS.
+ *
+ * Copyright (C) 2015 Vincent Pelletier <plr.vincent@gmail.com>
+ */
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/input.h>
+#include <linux/gpio_keys.h>
+
+static void qnap_tsx51_device_pdev_release(struct device *dev);
+
+static struct gpio_led qnap_tsx51_led[] =3D {
+	{
+		.name =3D "qnap_tsx51:green:status",
+		.gpio =3D 62,
+		.active_low =3D 1,
+		.default_state =3D LEDS_GPIO_DEFSTATE_ON,
+	},
+	{
+		.name =3D "qnap_tsx51:red:status",
+		.gpio =3D 63,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "qnap_tsx51:blue:usb",
+		.default_trigger =3D "usb-host",
+		.gpio =3D 17,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd1:red:sata",
+		.gpio =3D 70,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd2:red:sata",
+		.gpio =3D 71,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd3:red:sata",
+		.gpio =3D 72,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd4:red:sata",
+		.gpio =3D 73,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd5:red:sata",
+		.gpio =3D 74,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd6:red:sata",
+		.gpio =3D 75,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd7:red:sata",
+		.gpio =3D 76,
+		.active_low =3D 1,
+	},
+	{
+		.name =3D "hdd8:red:sata",
+		.gpio =3D 77,
+		.active_low =3D 1,
+	},
+};
+
+static struct gpio_led_platform_data qnap_tsx51_led_data =3D {
+	.num_leds =3D ARRAY_SIZE(qnap_tsx51_led),
+	.leds =3D qnap_tsx51_led,
+};
+
+static struct platform_device qnap_tsx51_leds_dev =3D {
+	.name =3D "leds-gpio",
+	.id =3D -1,
+	.dev =3D {
+		.release =3D qnap_tsx51_device_pdev_release,
+		.platform_data =3D &qnap_tsx51_led_data,
+	},
+};
+
+static struct gpio_keys_button qnap_tsx51_gpio_buttons[] =3D {
+	{
+		.code =3D KEY_COPY,
+		.gpio =3D 12,
+		.active_low =3D 1,
+		.desc =3D "Copy button",
+		.type =3D EV_KEY,
+		.wakeup =3D 0,
+		.debounce_interval =3D 100,
+		.can_disable =3D 0,
+	},
+	{
+		.code =3D KEY_RESTART,
+		.gpio =3D 61,
+		.active_low =3D 1,
+		.desc =3D "Reset button",
+		.type =3D EV_KEY,
+		.wakeup =3D 0,
+		.debounce_interval =3D 100,
+		.can_disable =3D 0,
+	},
+};
+
+static struct gpio_keys_platform_data qnap_tsx51_buttons_data =3D {
+	.buttons =3D qnap_tsx51_gpio_buttons,
+	.nbuttons =3D ARRAY_SIZE(qnap_tsx51_gpio_buttons),
+	.poll_interval =3D 20,
+};
+
+static struct platform_device qnap_tsx51_buttons_dev =3D {
+	.name =3D "gpio-keys-polled",
+	.id =3D -1,
+	.dev =3D {
+		.release =3D qnap_tsx51_device_pdev_release,
+		.platform_data =3D &qnap_tsx51_buttons_data,
+	},
+};
+
+static struct platform_device *qnap_tsx51_devs[] =3D {
+	&qnap_tsx51_buttons_dev,
+	&qnap_tsx51_leds_dev,
+};
+
+static void qnap_tsx51_device_pdev_release(struct device *dev)
+{
+/*
+ * Needed to silence this message:
+ * Device 'xxx' does not have a release() function, it is broken and must =
be
+ * fixed.
+ */
+}
+
+static int __init qnap_tsx51_init(void)
+{
+	int ret;
+
+	ret =3D request_module("gpio_f7188x");
+	if (ret)
+		return ret;
+
+	return platform_add_devices(
+		qnap_tsx51_devs,
+		ARRAY_SIZE(qnap_tsx51_devs)
+	);
+
+}
+
+static void __exit qnap_tsx51_exit(void)
+{
+	int i;
+	for (i =3D 0; i < ARRAY_SIZE(qnap_tsx51_devs); i++)
+		platform_device_unregister(qnap_tsx51_devs[i]);
+}
+
+module_init(qnap_tsx51_init);
+module_exit(qnap_tsx51_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("QNAP TS-x51 NAS");
+MODULE_AUTHOR("Vincent Pelletier <plr.vincent@gmail.com>");
--=20
2.8.1

--MP_/prZWcs0XRDVzDdhKoRRmhUl
Content-Type: application/octet-stream; name=hdd.rules
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=hdd.rules

QUNUSU9OPT0iYWRkfGNoYW5nZSIsIFNVQlNZU1RFTT09ImJsb2NrIiwgS0VSTkVMPT0ic2Q/Iiwg
S0VSTkVMUz09IjQ6MDowOjAiLCBTWU1MSU5LKz0icW5hcC9oZGQxIgpBQ1RJT049PSJhZGR8Y2hh
bmdlIiwgU1VCU1lTVEVNPT0iYmxvY2siLCBLRVJORUw9PSJzZD8iLCBLRVJORUxTPT0iMzowOjA6
MCIsIFNZTUxJTksrPSJxbmFwL2hkZDIiCkFDVElPTj09ImFkZHxjaGFuZ2UiLCBTVUJTWVNURU09
PSJibG9jayIsIEtFUk5FTD09InNkPyIsIEtFUk5FTFM9PSIyOjA6MDowIiwgU1lNTElOSys9InFu
YXAvaGRkMyIKQUNUSU9OPT0iYWRkfGNoYW5nZSIsIFNVQlNZU1RFTT09ImJsb2NrIiwgS0VSTkVM
PT0ic2Q/IiwgS0VSTkVMUz09Ijg6MDowOjAiLCBTWU1MSU5LKz0icW5hcC9oZGQ0IgpBQ1RJT049
PSJhZGR8Y2hhbmdlIiwgU1VCU1lTVEVNPT0iYmxvY2siLCBLRVJORUw9PSJzZD8iLCBLRVJORUxT
PT0iNzowOjA6MCIsIFNZTUxJTksrPSJxbmFwL2hkZDUiCkFDVElPTj09ImFkZHxjaGFuZ2UiLCBT
VUJTWVNURU09PSJibG9jayIsIEtFUk5FTD09InNkPyIsIEtFUk5FTFM9PSI2OjA6MDowIiwgU1lN
TElOSys9InFuYXAvaGRkNiIKQUNUSU9OPT0iYWRkfGNoYW5nZSIsIFNVQlNZU1RFTT09ImJsb2Nr
IiwgS0VSTkVMPT0ic2Q/IiwgS0VSTkVMUz09IjEtNCIsIFNZTUxJTksrPSJxbmFwL2J1aWx0aW5f
dXNiIgpBQ1RJT049PSJhZGR8Y2hhbmdlIiwgU1VCU1lTVEVNPT0iYmxvY2siLCBLRVJORUw9PSJz
ZD8iLCBLRVJORUxTPT0iMi0xLjMiLCBTWU1MSU5LKz0icW5hcC9mcm9udF91c2IiCg==

--MP_/prZWcs0XRDVzDdhKoRRmhUl
Content-Type: application/octet-stream; name=mdadm2leds
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=mdadm2leds

IyEvYmluL3NoCk1ERVZFTlQ9IiQxIgpNRERFVklDRT0iJDIiClBIWVNERVZJQ0U9IiQzIgoKTEVE
X1BBVEg9Ii9zeXMvY2xhc3MvbGVkcyIKTEVEX0RJU0tfU1VGRklYPSI6cmVkOnNhdGEiClNUQVRV
U19QQVRIPSIvcnVuLyQoYmFzZW5hbWUgIiQwIikiCnRlc3QgLWQgIiRTVEFUVVNfUEFUSCIgfHwg
bWtkaXIgIiRTVEFUVVNfUEFUSCIKCnVwZGF0ZV9sZWQoKQp7CiAgICBMRUQ9IiR7TEVEX1BBVEh9
LyQxIgogICAgU1RBVFVTPSIke1NUQVRVU19QQVRIfS8kezF9OiIKICAgIHRlc3QgLWQgIiRMRUQi
IHx8IHJldHVybiAxCiAgICBpZiAgIFsgLWUgIiR7U1RBVFVTfWxvY2F0ZSIgXTsgdGhlbgogICAg
ICAgIFRSSUdHRVI9InRpbWVyIgogICAgICAgIEJSSUdIVE5FU1M9MQogICAgICAgIERFTEFZX09O
PTEyNQogICAgICAgIERFTEFZX09GRj0xMjUKICAgIGVsaWYgWyAtZSAiJHtTVEFUVVN9ZXJyb3Ii
IF07IHRoZW4KICAgICAgICBUUklHR0VSPSJub25lIgogICAgICAgIEJSSUdIVE5FU1M9MQogICAg
ZWxpZiBbIC1lICIke1NUQVRVU31wcmVmYWlsIiBdOyB0aGVuCiAgICAgICAgIyBYWFg6IHN0YW5k
YXJkIHNheXMgIjIgYmxpbmtzIGF0IDQgSHosIDEgcGF1c2UgYXQgMiBIeiIgYnV0IGxlZAogICAg
ICAgICMgdHJpZ2dlcnMgY2Fubm90IHJlcHJvZHVjdCB0aGlzLCBzbyBpbnN0ZWFkIGdvIGZvciAx
SHosCiAgICAgICAgIyAyNSUgZHV0eSBjeWNsZS4KICAgICAgICBUUklHR0VSPSJ0aW1lciIKICAg
ICAgICBCUklHSFRORVNTPTEKICAgICAgICBERUxBWV9PTj0yNTAKICAgICAgICBERUxBWV9PRkY9
NzUwCiAgICBlbGlmIFsgLWUgIiR7U1RBVFVTfXJlYnVpbGQiIF07IHRoZW4KICAgICAgICBUUklH
R0VSPSJ0aW1lciIKICAgICAgICBCUklHSFRORVNTPTEKICAgICAgICBERUxBWV9PTj01MDAKICAg
ICAgICBERUxBWV9PRkY9NTAwCiAgICBlbHNlCiAgICAgICAgIyBBbGwgZmluZSwgdHVybiBsZWQg
b2ZmCiAgICAgICAgVFJJR0dFUj0ibm9uZSIKICAgICAgICBCUklHSFRORVNTPTAKICAgIGZpCgog
ICAgZWNobyAiJFRSSUdHRVIiID4gIiR7TEVEfS90cmlnZ2VyIgogICAgZWNobyAiJEJSSUdIVE5F
U1MiID4gIiR7TEVEfS9icmlnaHRuZXNzIgogICAgY2FzZSAiJFRSSUdHRVIiIGluCiAgICAgICAg
dGltZXIpCiAgICAgICAgICAgIGVjaG8gIiRERUxBWV9PTiIgPiAiJHtMRUR9L2RlbGF5X29uIgog
ICAgICAgICAgICBlY2hvICIkREVMQVlfT0ZGIiA+ICIke0xFRH0vZGVsYXlfb2ZmIgogICAgICAg
ICAgICA7OwogICAgZXNhYwp9CgpzZXRfbGVkKCkKewogICAgU1RBVFVTPSIke1NUQVRVU19QQVRI
fS8kezF9OiIKICAgIGNhc2UgIiQyIiBpbgogICAgICAgIGZhaWwpCiAgICAgICAgICAgIHRvdWNo
ICIke1NUQVRVU31lcnJvciIKICAgICAgICAgICAgOzsKICAgICAgICByZWNvdmVyaW5nKQogICAg
ICAgICAgICB0b3VjaCAiJHtTVEFUVVN9cmVidWlsZCIKICAgICAgICAgICAgcm0gICAgIiR7U1RB
VFVTfWVycm9yIgogICAgICAgICAgICA7OwogICAgICAgIHJlY292ZXJlZCkKICAgICAgICAgICAg
cm0gICAgIiR7U1RBVFVTfXJlYnVpbGQiCiAgICAgICAgICAgIDs7CiAgICAgICAgcHJlZmFpbCkK
ICAgICAgICAgICAgdG91Y2ggIiR7U1RBVFVTfXByZWZhaWwiCiAgICAgICAgICAgIDs7CiAgICAg
ICAgc3RhcnRfbG9jYXRlKQogICAgICAgICAgICB0b3VjaCAiJHtTVEFUVVN9bG9jYXRlIgogICAg
ICAgICAgICA7OwogICAgICAgIHN0b3BfbG9jYXRlKQogICAgICAgICAgICBybSAgICAiJHtTVEFU
VVN9bG9jYXRlIgogICAgICAgICAgICA7OwogICAgICAgIGZvcmdldCkKICAgICAgICAgICAgcm0g
ICAgIiR7U1RBVFVTfWxvY2F0ZSIKICAgICAgICAgICAgcm0gICAgIiR7U1RBVFVTfWVycm9yIgog
ICAgICAgICAgICBybSAgICAiJHtTVEFUVVN9cHJlZmFpbCIKICAgICAgICAgICAgcm0gICAgIiR7
U1RBVFVTfXJlYnVpbGQiCiAgICAgICAgICAgIDs7CiAgICAgICAgKikKICAgICAgICAgICAgcmV0
dXJuIDEKICAgICAgICAgICAgOzsKICAgIGVzYWMKICAgIHVwZGF0ZV9sZWQgIiQxIgp9CgpkaXNr
X2xlZCgpCnsKICAgIERJU0s9IiQxIgogICAgc2hpZnQKICAgIHRlc3QgLW4gIiRESVNLIiB8fCBy
ZXR1cm4gMQogICAgU1lTUEFUSD0iL3N5cyQodWRldmFkbSBpbmZvIC0tcXVlcnk9cGF0aCAiJERJ
U0siKSIKICAgIHRlc3QgLWUgIiRTWVNQQVRIL3BhcnRpdGlvbiIgJiYgU1lTUEFUSD0iJChkaXJu
YW1lICIkU1lTUEFUSCIpIgogICAgZm9yIFNZTUxJTksgaW4gJCh1ZGV2YWRtIGluZm8gLS1xdWVy
eT1zeW1saW5rICIkU1lTUEFUSCIpOyBkbwogICAgICAgIGlmIGVjaG8gIiRTWU1MSU5LIiB8IGdy
ZXAgLXEgIl5xbmFwLyI7IHRoZW4KICAgICAgICAgICAgc2V0X2xlZCAiJChlY2hvICIkU1lNTElO
SyIgfCBzZWQgInNAXnFuYXAvQEAiKSRMRURfRElTS19TVUZGSVgiICIkQCIKICAgICAgICAgICAg
cmV0dXJuICQ/CiAgICAgICAgZmkKICAgIGRvbmUKICAgIHJldHVybiAxCn0KCmFycmF5X2xlZCgp
CnsKICAgIEFSUkFZPSIkMSIKICAgIHNoaWZ0CiAgICBmb3IgREVWSUNFIGluICIvc3lzJCh1ZGV2
YWRtIGluZm8gLS1xdWVyeT1wYXRoICIkQVJSQVkiKS8ic2xhdmVzLyo7IGRvCiAgICAgICAgZGlz
a19sZWQgIiRERVZJQ0UiICIkQCIKICAgIGRvbmUKfQoKY2FzZSAiJE1ERVZFTlQiIGluCiAgICBE
ZWdyYWRlZEFycmF5IHwgU3BhcmVzTWlzc2luZykKICAgICAgICBhcnJheV9sZWQgIiRNRERFVklD
RSIgcHJlZmFpbAogICAgICAgIDs7CiAgICBGYWlsIHwgRmFpbFNwYXJlKQogICAgICAgIGRpc2tf
bGVkICIkUEhZU0RFVklDRSIgZmFpbAogICAgICAgIDs7CiAgICBUZXN0TWVzc2FnZSkKICAgICAg
ICBpZiBbICQjIC1lcSAzIF07IHRoZW4KICAgICAgICAgICAgdHJhcCAiZGlza19sZWQgXCIkUEhZ
U0RFVklDRVwiIHN0b3BfbG9jYXRlIiAwCiAgICAgICAgICAgIGRpc2tfbGVkICIkUEhZU0RFVklD
RSIgc3RhcnRfbG9jYXRlCiAgICAgICAgZWxzZQogICAgICAgICAgICB0cmFwICJhcnJheV9sZWQg
XCIkTURERVZJQ0VcIiBzdG9wX2xvY2F0ZSIgMAogICAgICAgICAgICBhcnJheV9sZWQgIiRNRERF
VklDRSIgc3RhcnRfbG9jYXRlCiAgICAgICAgZmkKICAgICAgICBzbGVlcCA1CiAgICAgICAgOzsK
ICAgIFJlYnVpbGRTdGFydGVkIHwgUmVidWlsZD8/KQogICAgICAgIGFycmF5X2xlZCAiJE1EREVW
SUNFIiByZWNvdmVyaW5nCiAgICAgICAgOzsKICAgIFJlYnVpbGRGaW5pc2hlZCkKICAgICAgICBh
cnJheV9sZWQgIiRNRERFVklDRSIgcmVjb3ZlcmVkCiAgICAgICAgOzsKCiMgTm9uLW1kYWRtIGV2
ZW50cwogICAgcmVmcmVzaCkKICAgICAgICBmb3IgTEVEIGluICIkTEVEX1BBVEgvImhkZCoiJExF
RF9ESVNLX1NVRkZJWCI7IGRvCiAgICAgICAgICAgIHVwZGF0ZV9sZWQgIiQoYmFzZW5hbWUgIiRM
RUQiKSIKICAgICAgICBkb25lCiAgICAgICAgOzsKZXNhYwo=

--MP_/prZWcs0XRDVzDdhKoRRmhUl--

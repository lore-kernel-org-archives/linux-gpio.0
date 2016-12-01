From: David Howells <dhowells@redhat.com>
Subject: [PATCH 08/39] Annotate hardware config module parameters in
 drivers/gpio/
Date: Thu, 01 Dec 2016 12:30:40 +0000
Message-ID: <148059543997.31612.610019846448617763.stgit@warthog.procyon.org.uk>
References: <148059537897.31612.9461043954611464597.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <148059537897.31612.9461043954611464597.stgit@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, minyard@acm.org, gnomes@lxorguk.ukuu.org.uk, Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, dhowells@redhat.com, linux-gpio@vger.kernel.org, linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When the kernel is running in secure boot mode, we lock down the kernel to
prevent userspace from modifying the running kernel image.  Whilst this
includes prohibiting access to things like /dev/mem, it must also prevent
access by means of configuring driver modules in such a way as to cause a
device to access or modify the kernel image.

To this end, annotate module_param* statements that refer to hardware
configuration and indicate for future reference what type of parameter they
specify.  The parameter parser in the core sees this information and can
skip such parameters with an error message if the kernel is locked down.
The module initialisation then runs as normal, but just sees whatever the
default values for those parameters is.

Note that we do still need to do the module initialisation because some
drivers have viable defaults set in case parameters aren't specified and
some drivers support automatic configuration (e.g. PNP or PCI) in addition
to manually coded parameters.

This patch annotates drivers in drivers/gpio/.

Suggested-by: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: William Breathitt Gray <vilhelm.gray@gmail.com>
cc: Linus Walleij <linus.walleij@linaro.org>
cc: Alexandre Courbot <gnurou@gmail.com>
cc: linux-gpio@vger.kernel.org
---

 drivers/gpio/gpio-104-dio-48e.c |    4 ++--
 drivers/gpio/gpio-104-idi-48.c  |    4 ++--
 drivers/gpio/gpio-104-idio-16.c |    4 ++--
 drivers/gpio/gpio-gpio-mm.c     |    2 +-
 drivers/gpio/gpio-ws16c48.c     |    4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index fcf776971ca9..1c334eed5821 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -33,11 +33,11 @@
 
 static unsigned int base[MAX_NUM_DIO48E];
 static unsigned int num_dio48e;
-module_param_array(base, uint, &num_dio48e, 0);
+module_param_hw_array(base, uint, ioport, &num_dio48e, 0);
 MODULE_PARM_DESC(base, "ACCES 104-DIO-48E base addresses");
 
 static unsigned int irq[MAX_NUM_DIO48E];
-module_param_array(irq, uint, NULL, 0);
+module_param_hw_array(irq, uint, irq, NULL, 0);
 MODULE_PARM_DESC(irq, "ACCES 104-DIO-48E interrupt line numbers");
 
 /**
diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 2d2763ea1a68..6639920b3299 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -33,11 +33,11 @@
 
 static unsigned int base[MAX_NUM_IDI_48];
 static unsigned int num_idi_48;
-module_param_array(base, uint, &num_idi_48, 0);
+module_param_hw_array(base, uint, ioport, &num_idi_48, 0);
 MODULE_PARM_DESC(base, "ACCES 104-IDI-48 base addresses");
 
 static unsigned int irq[MAX_NUM_IDI_48];
-module_param_array(irq, uint, NULL, 0);
+module_param_hw_array(irq, uint, irq, NULL, 0);
 MODULE_PARM_DESC(irq, "ACCES 104-IDI-48 interrupt line numbers");
 
 /**
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 6787b8fcf0d8..6d7024ac2689 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -33,11 +33,11 @@
 
 static unsigned int base[MAX_NUM_IDIO_16];
 static unsigned int num_idio_16;
-module_param_array(base, uint, &num_idio_16, 0);
+module_param_hw_array(base, uint, ioport, &num_idio_16, 0);
 MODULE_PARM_DESC(base, "ACCES 104-IDIO-16 base addresses");
 
 static unsigned int irq[MAX_NUM_IDIO_16];
-module_param_array(irq, uint, NULL, 0);
+module_param_hw_array(irq, uint, irq, NULL, 0);
 MODULE_PARM_DESC(irq, "ACCES 104-IDIO-16 interrupt line numbers");
 
 /**
diff --git a/drivers/gpio/gpio-gpio-mm.c b/drivers/gpio/gpio-gpio-mm.c
index 1e7def9449ce..4ac2179b96ad 100644
--- a/drivers/gpio/gpio-gpio-mm.c
+++ b/drivers/gpio/gpio-gpio-mm.c
@@ -31,7 +31,7 @@
 
 static unsigned int base[MAX_NUM_GPIOMM];
 static unsigned int num_gpiomm;
-module_param_array(base, uint, &num_gpiomm, 0);
+module_param_hw_array(base, uint, ioport, &num_gpiomm, 0);
 MODULE_PARM_DESC(base, "Diamond Systems GPIO-MM base addresses");
 
 /**
diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index eaa71d440ccf..c84d600a8bb0 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -30,11 +30,11 @@
 
 static unsigned int base[MAX_NUM_WS16C48];
 static unsigned int num_ws16c48;
-module_param_array(base, uint, &num_ws16c48, 0);
+module_param_hw_array(base, uint, ioport, &num_ws16c48, 0);
 MODULE_PARM_DESC(base, "WinSystems WS16C48 base addresses");
 
 static unsigned int irq[MAX_NUM_WS16C48];
-module_param_array(irq, uint, NULL, 0);
+module_param_hw_array(irq, uint, irq, NULL, 0);
 MODULE_PARM_DESC(irq, "WinSystems WS16C48 interrupt line numbers");
 
 /**

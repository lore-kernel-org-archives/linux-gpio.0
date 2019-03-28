From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Thu, 28 Mar 2019 20:19:59 +0800
Message-ID: <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
References: <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
 <20171116124431.GS17200@lahna.fi.intel.com> <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
 <20171117064904.GZ17200@lahna.fi.intel.com> <CAB4CAwdGQjXc6gsswyCgLTfFRN9CgcC=OJ6pz4rX-HCn8AT-TQ@mail.gmail.com>
 <20171121105205.GP22431@lahna.fi.intel.com> <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
 <20171121120422.GR22431@lahna.fi.intel.com> <CAD8Lp444FNHZh6fLUfhfp1i_UBpMbS5QuvJ4FuZn7PKH1Ucy=A@mail.gmail.com>
 <20190327172940.GR3622@lahna.fi.intel.com> <20190328091729.GV9224@smile.fi.intel.com>
 <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 28, 2019 at 5:38 PM Daniel Drake <drake@endlessm.com> wrote:
>
> On Thu, Mar 28, 2019 at 5:17 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > Hmm... Can you confirm that laptop you declared as a fixed case and the
> > mentioned here is the same one?
>
> They are definitely not the same exact unit - originally we had a
> pre-production sample, and now we briefly diagnosed a real production
> unit that was sold to a customer. There could be subtle motherboard
> variations as you mention.
>
> > If it's the case, I recommend to ping Asus again and make them check and fix.
>
> We'll keep an eye open for any opportunities to go deeper here.
> However further investigation on both our side and theirs is blocked
> by not having any of the affected hardware (since the models are now
> so old), so I'm not very optimistic that we'll be able to make
> progress there.
>
> > Meanwhile, Mika's proposal sounds feasible and not so intrusive. We may
> > implement this later on.
>
> Chris will work on implementing this for your consideration.
>
> Thanks for the quick feedback!
> Daniel

What if I modify the patch as follows? It doesn't save HOSTSW_OWN register.
It just toggles the bit specifically for the IRQ GPIO pin after resume when DMI
matches.

---
 drivers/pinctrl/intel/pinctrl-intel.c | 67 +++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
b/drivers/pinctrl/intel/pinctrl-intel.c
index 8cda7b535b02..994abc5ecd32 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -19,6 +19,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/dmi.h>

 #include "../core.h"
 #include "pinctrl-intel.h"
@@ -73,6 +74,8 @@

 #define DEBOUNCE_PERIOD                        31250 /* ns */

+#define PINCTRL_QUIRK_KEEP_HOSTOWN     BIT(0)
+
 struct intel_pad_context {
        u32 padcfg0;
        u32 padcfg1;
@@ -112,11 +115,37 @@ struct intel_pinctrl {
        size_t ncommunities;
        struct intel_pinctrl_context context;
        int irq;
+       u32 quirks;
 };

 #define pin_to_padno(c, p)     ((p) - (c)->pin_base)
 #define padgroup_offset(g, p)  ((p) - (g)->base)

+static const struct dmi_system_id dmi_retain_hostown_table[] = {
+       {
+               .ident = "ASUSTeK COMPUTER INC. ASUS E403NA",
+               .matches = {
+                       DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+                       DMI_MATCH(DMI_BOARD_NAME, "E403NA"),
+               },
+       },
+       {
+               .ident = "ASUSTeK COMPUTER INC. ASUS X540NA",
+               .matches = {
+                       DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+                       DMI_MATCH(DMI_BOARD_NAME, "X540NA"),
+               },
+       },
+       {
+               .ident = "ASUSTeK COMPUTER INC. ASUS X541NA",
+               .matches = {
+                       DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+                       DMI_MATCH(DMI_BOARD_NAME, "X541NA"),
+               },
+       },
+       { }
+};
+
 static struct intel_community *intel_get_community(struct intel_pinctrl *pctrl,
                                                   unsigned int pin)
 {
@@ -219,6 +248,32 @@ static bool intel_pad_acpi_mode(struct
intel_pinctrl *pctrl, unsigned int pin)
        return !(readl(hostown) & BIT(gpp_offset));
 }

+static void intel_pad_force_hostown(struct intel_pinctrl *pctrl,
unsigned int pin)
+{
+       const struct intel_community *community;
+       const struct intel_padgroup *padgrp;
+       unsigned int offset, gpp_offset;
+       void __iomem *hostown;
+
+       community = intel_get_community(pctrl, pin);
+       if (!community)
+               return;
+       if (!community->hostown_offset)
+               return;
+
+       padgrp = intel_community_get_padgroup(community, pin);
+       if (!padgrp)
+               return;
+
+       gpp_offset = padgroup_offset(padgrp, pin);
+       offset = community->hostown_offset + padgrp->reg_num * 4;
+       hostown = community->regs + offset;
+
+       writel(readl(hostown) | BIT(gpp_offset), hostown);
+
+       return;
+}
+
 static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
 {
        struct intel_community *community;
@@ -1318,6 +1373,11 @@ int intel_pinctrl_probe(struct platform_device *pdev,
        pctrl->soc = soc_data;
        raw_spin_lock_init(&pctrl->lock);

+       if (dmi_first_match(dmi_retain_hostown_table)) {
+               pctrl->quirks |= PINCTRL_QUIRK_KEEP_HOSTOWN;
+               dev_info(&pdev->dev, "enabling KEEP_HOSTOWN quirk on
this hw\n");
+       }
+
        /*
         * Make a copy of the communities which we can use to hold pointers
         * to the registers.
@@ -1549,6 +1609,13 @@ int intel_pinctrl_resume(struct device *dev)
                if (!intel_pinctrl_should_save(pctrl, desc->number))
                        continue;

+               if ((pctrl->quirks & PINCTRL_QUIRK_KEEP_HOSTOWN) &&
+                   intel_pad_acpi_mode(pctrl, desc->number)) {
+                       intel_pad_force_hostown(pctrl, desc->number);
+                       dev_dbg(dev, "restored hostown for pin %d\n",
+                               desc->number);
+               }
+
                padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG0);
                val = readl(padcfg) & ~PADCFG0_GPIORXSTATE;
                if (val != pads[i].padcfg0) {
--
2.21.0

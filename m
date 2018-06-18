From: Tony Lindgren <tony@atomide.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in
 pinctrl_groups and deferred probing
Date: Mon, 18 Jun 2018 02:54:28 -0700
Message-ID: <20180618095428.GQ112168@atomide.com>
References: <F20BD6B3-D4D7-4D5D-B464-64402650BDE5@goldelico.com>
 <20180614120157.GE112168@atomide.com>
 <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com>
 <20180615065810.GI112168@atomide.com>
 <20180615111318.GJ112168@atomide.com>
 <029F115C-480E-485A-B547-9D5873925CEF@goldelico.com>
 <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com>
 <CAHp75Vf7-xcsoSJ--9nJYbxpwSfDv201UwnxJHoFbwtD187SPw@mail.gmail.com>
 <20180618091433.GP112168@atomide.com>
 <BB5DB278-9827-4351-99DF-54C875B1879F@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BB5DB278-9827-4351-99DF-54C875B1879F@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@pyra-handheld.com, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-gpio@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [180618 09:32]:
> 
> > Am 18.06.2018 um 11:14 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > * Andy Shevchenko <andy.shevchenko@gmail.com> [180618 08:25]:
> >> On Sat, Jun 16, 2018 at 2:08 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>> But it looks as if we still have duplicate assignments by deferred probing, i.e. some cleanup is
> >>> missing (or is this intended behaviour?).
> >> 
> >>> But I think the fundamental problem is that the same driver assigns multiple slots if
> >>> probing is deferred.
> >> 
> >> Indeed.
> >> 
> >> I think there is a simple way to clean up pinctrl stuff on failed probe. See
> >> https://elixir.bootlin.com/linux/v4.18-rc1/source/drivers/base/dd.c#L416
> >> 
> >> We only bind pins, and do not perform any actions when failure happens later on.
> > 
> > Yup seems like a good approach. I'll take a look if we can just
> > check if the function or group name already exists and return
> > the existing selector in that case.
> 
> Ok, that would also solve the duplication issue.

Below is an incremental patch to check for existing entries. Care
to test again?

If that works, I'll fold it into the patch series and repost the
whole series.

> On the other hand we still have a stale entry if the probing process
> finally fails after several attempts.
>
> This may happen if a driver with a valid DT entry is blacklisted in
> /etc/modprobe.d/blacklist.conf. Then, the kernel will try to modprobe
> it several times through udev until it gives up. The reason seems to
> be that the deferred probing thread does not know why the driver did
> not probe successfully.

Hmm I think this might be fixed then too. Then on pinctrl module
unbind/unload we should free the radix tree entries if that is
not yet done. Seems we may only free them on -ENOMEM right now.

Regards,

Tony

8< ------------------------
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -617,6 +617,26 @@ struct group_desc *pinctrl_generic_get_group(struct pinctrl_dev *pctldev,
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_get_group);
 
+static int pinctrl_generic_group_name_to_selector(struct pinctrl_dev *pctldev,
+						  const char *function)
+{
+	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
+	unsigned ngroups = ops->get_groups_count(pctldev);
+	unsigned selector = 0;
+
+	/* See if this pctldev has this group */
+	while (selector < ngroups) {
+		const char *gname = ops->get_group_name(pctldev, selector);
+
+		if (!strcmp(function, gname))
+			return selector;
+
+		selector++;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * pinctrl_generic_add_group() - adds a new pin group
  * @pctldev: pin controller device
@@ -631,7 +651,13 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
 			      int *pins, int num_pins, void *data)
 {
 	struct group_desc *group;
-	int selector = pctldev->num_groups;
+	int selector;
+
+	selector = pinctrl_generic_group_name_to_selector(pctldev, name);
+	if (selector >= 0)
+		return selector;
+
+	selector = pctldev->num_groups;
 
 	group = devm_kzalloc(pctldev->dev, sizeof(*group), GFP_KERNEL);
 	if (!group)
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -308,7 +308,6 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 		selector++;
 	}
 
-	dev_err(pctldev->dev, "function '%s' not supported\n", function);
 	return -EINVAL;
 }
 
@@ -775,7 +774,13 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				void *data)
 {
 	struct function_desc *function;
-	int selector = pctldev->num_functions;
+	int selector;
+
+	selector = pinmux_func_name_to_selector(pctldev, name);
+	if (selector >= 0)
+		return selector;
+
+	selector = pctldev->num_functions;
 
 	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
 	if (!function)
-- 
2.17.1

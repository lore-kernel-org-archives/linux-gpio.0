Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950CCC433E6
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 08:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BCCC64E53
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Feb 2021 08:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhBJIbz (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Feb 2021 03:31:55 -0500
Received: from smtprelay0031.hostedemail.com ([216.40.44.31]:33310 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229797AbhBJIbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Feb 2021 03:31:15 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id A4164182E668C;
        Wed, 10 Feb 2021 08:30:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: game81_0e0f4882760e
X-Filterd-Recvd-Size: 7147
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Wed, 10 Feb 2021 08:30:22 +0000 (UTC)
Message-ID: <87437daafdd86fa5c765ff9b17b6c7b097f0c317.camel@perches.com>
Subject: Re: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs
 files
From:   Joe Perches <joe@perches.com>
To:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Date:   Wed, 10 Feb 2021 00:30:21 -0800
In-Reply-To: <20210210074946.155417-2-drew@beagleboard.org>
References: <20210210074946.155417-1-drew@beagleboard.org>
         <20210210074946.155417-2-drew@beagleboard.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2021-02-09 at 23:49 -0800, Drew Fustini wrote:
> Switch over pinctrl debugfs files to use octal permissions as they are
> preferred over symbolic permissions. Refer to commit f90774e1fd27
> ("checkpatch: look for symbolic permissions and suggest octal instead").
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/core.c    | 6 +++---
>  drivers/pinctrl/pinconf.c | 4 ++--
>  drivers/pinctrl/pinmux.c  | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 3663d87f51a0..c9c28f653799 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
>  		return;
>  	}
>  
> 
> -	debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> +	debugfs_create_file("pinctrl-devices", 0400,
>  			    debugfs_root, NULL, &pinctrl_devices_fops);

NAK.  You've changed the permission levels.

S_IRUGO is 0444 not 0400.
And you have to keep the S_IFREG or'd along with the octal.

include/linux/stat.h:#define S_IRUGO            (S_IRUSR|S_IRGRP|S_IROTH)

checkpatch does this conversion using this command line:

$ ./scripts/checkpatch.pl -f --show-types --terse drivers/pinctrl/*.[ch] --types=SYMBOLIC_PERMS --fix-inplace
drivers/pinctrl/core.c:1893: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
drivers/pinctrl/core.c:1895: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
drivers/pinctrl/core.c:1897: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
drivers/pinctrl/core.c:1919: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
drivers/pinctrl/core.c:1921: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
drivers/pinctrl/core.c:1923: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
total: 0 errors, 6 warnings, 2302 lines checked
drivers/pinctrl/pinconf.c:373: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
drivers/pinctrl/pinconf.c:375: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
total: 0 errors, 2 warnings, 379 lines checked
drivers/pinctrl/pinmux.c:679: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
drivers/pinctrl/pinmux.c:681: WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
total: 0 errors, 2 warnings, 854 lines checked

$ git diff --stat -p drivers/pinctrl/
 drivers/pinctrl/core.c    | 12 ++++++------
 drivers/pinctrl/pinconf.c |  4 ++--
 drivers/pinctrl/pinmux.c  |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 7d3370289938..6992b805ae41 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1890,11 +1890,11 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
 			dev_name(pctldev->dev));
 		return;
 	}
-	debugfs_create_file("pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pins", S_IFREG | 0444,
 			    device_root, pctldev, &pinctrl_pins_fops);
-	debugfs_create_file("pingroups", S_IFREG | S_IRUGO,
+	debugfs_create_file("pingroups", S_IFREG | 0444,
 			    device_root, pctldev, &pinctrl_groups_fops);
-	debugfs_create_file("gpio-ranges", S_IFREG | S_IRUGO,
+	debugfs_create_file("gpio-ranges", S_IFREG | 0444,
 			    device_root, pctldev, &pinctrl_gpioranges_fops);
 	if (pctldev->desc->pmxops)
 		pinmux_init_device_debugfs(device_root, pctldev);
@@ -1916,11 +1916,11 @@ static void pinctrl_init_debugfs(void)
 		return;
 	}
 
-	debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-devices", S_IFREG | 0444,
 			    debugfs_root, NULL, &pinctrl_devices_fops);
-	debugfs_create_file("pinctrl-maps", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-maps", S_IFREG | 0444,
 			    debugfs_root, NULL, &pinctrl_maps_fops);
-	debugfs_create_file("pinctrl-handles", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-handles", S_IFREG | 0444,
 			    debugfs_root, NULL, &pinctrl_fops);
 }
 
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 02c075cc010b..f9ee12b50428 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -370,9 +370,9 @@ DEFINE_SHOW_ATTRIBUTE(pinconf_groups);
 void pinconf_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
-	debugfs_create_file("pinconf-pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinconf-pins", S_IFREG | 0444,
 			    devroot, pctldev, &pinconf_pins_fops);
-	debugfs_create_file("pinconf-groups", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinconf-groups", S_IFREG | 0444,
 			    devroot, pctldev, &pinconf_groups_fops);
 }
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 36a11c9e893a..ea7559a25fed 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -676,9 +676,9 @@ DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
-	debugfs_create_file("pinmux-functions", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinmux-functions", S_IFREG | 0444,
 			    devroot, pctldev, &pinmux_functions_fops);
-	debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinmux-pins", S_IFREG | 0444,
 			    devroot, pctldev, &pinmux_pins_fops);
 }
 


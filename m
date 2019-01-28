From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH RESEND 4/4] Pinctrl: Ingenic: Fix const declaration.
Date: Mon, 28 Jan 2019 11:22:42 -0800
Message-ID: <c6de4935a2b3acdbcc9146af702322c58707c9f5.camel@perches.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
         <1548410393-6981-5-git-send-email-zhouyanjie@zoho.com>
         <1548439157.1804.1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548439157.1804.1@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linus.walleij@linaro.org, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, paul.burton@mips.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: linux-gpio@vger.kernel.org

On Fri, 2019-01-25 at 14:59 -0300, Paul Cercueil wrote:
> On Fri, Jan 25, 2019 at 6:59 AM, Zhou Yanjie <zhouyanjie@zoho.com> 
> wrote:
> > Warning is reported when checkpatch indicates that
> > "static const char * array" should be changed to
> > "static const char * const".
[]
> > diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
[]
> > @@ -172,23 +172,25 @@ static const struct group_desc jz4740_groups[] 
[]
> > +static const char * const jz4740_mmc_groups[] = { "mmc-1bit", 
> > "mmc-4bit", };
> >  static const struct function_desc jz4740_functions[] = {
> >  	{ "mmc", jz4740_mmc_groups, ARRAY_SIZE(jz4740_mmc_groups), },
> 
> With this patch applied I get this:
> 
> drivers/pinctrl/pinctrl-ingenic.c:196:11: attention : initialization 
> discards
> ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>   { "mmc", jz4740_mmc_groups, ARRAY_SIZE(jz4740_mmc_groups), },
>            ^~~~~~~~~~~~~~~~~

You could change group_names to const char * const group_names
in pinmux.h

---
 drivers/pinctrl/pinmux.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 3319535c76cb..2b903774ba5c 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -122,7 +122,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  */
 struct function_desc {
 	const char *name;
-	const char **group_names;
+	const char * const *group_names;
 	int num_group_names;
 	void *data;
 };

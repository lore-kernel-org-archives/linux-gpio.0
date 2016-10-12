From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc()
 fails
Date: Wed, 12 Oct 2016 14:36:16 +0200
Message-ID: <20161012123616.ff7kiwbsyrnvhwff@linux-x5ow.site>
References: <20161012081422.GA27222@mwanda>
 <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
 <20161012084526.GG5630@mwanda>
 <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
 <20161012111924.GJ5630@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34133 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754876AbcJLMgS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 08:36:18 -0400
Content-Disposition: inline
In-Reply-To: <20161012111924.GJ5630@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Oct 12, 2016 at 02:19:24PM +0300, Dan Carpenter wrote:
> On Wed, Oct 12, 2016 at 11:44:36AM +0200, Johannes Thumshirn wrote:
> > On Wed, Oct 12, 2016 at 11:45:27AM +0300, Dan Carpenter wrote:
> > > On Wed, Oct 12, 2016 at 10:30:02AM +0200, Johannes Thumshirn wrote:
> > > > Oh I see. Damn, missed the devm_kzalloc(). But shouldn't we avoid krealloc()
> > > > on devm_kzalloc() in general? krealloc() calls kfree() if the reallocation
> > > > succeeded and this will break the devres tracking, wouldn't it?
> > > 
> > > Good point.  I will update my test to check for that.
> > 
> > Well the initial problem still stands, how do we fix the possible double
> > free? I think I could "just" change the devm_kzalloc() to kzalloc() (and
> > introduce cleanups) but I'm not sure this is a good solution. The whoule point
> > of these devm stuff is to apply a safety net, isn't it?
> 
> No.  It's just a convenience because we allocate so much stuff on probe.
> A few people use it like that, where they try to manage their own memory
> and use devm_ at the same time and it annoys me.
> 
> Just use kzalloc().  But make sure there is a free somewhere.

Unfortunately changing the allocation function for pctrl->functions in
berlin_pinctrl_build_state() also ment that I had to change it for the
function group so the error handling path is not so straight forward.
That's what I came up with:

>From 41899a7bce490a49b5cebe9586a07ff7e2f1b784 Mon Sep 17 00:00:00 2001
From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Wed, 12 Oct 2016 14:15:52 +0200
Subject: [PATCH] pinctrl: berlin: don't krealloc devm managed memory

Don't krealloc devm managed memory instead allocate the memory which will
likely get reallocated using the traditional unmanaged allocators.

Fixes: e1547af8c (pinctrl: berlin: Don't leak memory if krealloc() fails)
Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/pinctrl/berlin/berlin-bg2.c   |  1 +
 drivers/pinctrl/berlin/berlin-bg2cd.c |  1 +
 drivers/pinctrl/berlin/berlin-bg2q.c  |  1 +
 drivers/pinctrl/berlin/berlin-bg4ct.c |  1 +
 drivers/pinctrl/berlin/berlin.c       | 60 ++++++++++++++++++++++++-----------
 drivers/pinctrl/berlin/berlin.h       | 21 ++++++++++++
 6 files changed, 66 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin-bg2.c b/drivers/pinctrl/berlin/berlin-bg2.c
index fabe728..733bc62 100644
--- a/drivers/pinctrl/berlin/berlin-bg2.c
+++ b/drivers/pinctrl/berlin/berlin-bg2.c
@@ -239,6 +239,7 @@ static int berlin2_pinctrl_probe(struct platform_device *pdev)
 
 static struct platform_driver berlin2_pinctrl_driver = {
 	.probe	= berlin2_pinctrl_probe,
+	.remove = berlin_pinctrl_remove,
 	.driver	= {
 		.name = "berlin-bg2-pinctrl",
 		.of_match_table = berlin2_pinctrl_match,
diff --git a/drivers/pinctrl/berlin/berlin-bg2cd.c b/drivers/pinctrl/berlin/berlin-bg2cd.c
index ad8c758..70fcc77 100644
--- a/drivers/pinctrl/berlin/berlin-bg2cd.c
+++ b/drivers/pinctrl/berlin/berlin-bg2cd.c
@@ -184,6 +184,7 @@ static int berlin2cd_pinctrl_probe(struct platform_device *pdev)
 
 static struct platform_driver berlin2cd_pinctrl_driver = {
 	.probe	= berlin2cd_pinctrl_probe,
+	.remove = berlin_pinctrl_remove,
 	.driver	= {
 		.name = "berlin-bg2cd-pinctrl",
 		.of_match_table = berlin2cd_pinctrl_match,
diff --git a/drivers/pinctrl/berlin/berlin-bg2q.c b/drivers/pinctrl/berlin/berlin-bg2q.c
index cd171ae..a0e80f4 100644
--- a/drivers/pinctrl/berlin/berlin-bg2q.c
+++ b/drivers/pinctrl/berlin/berlin-bg2q.c
@@ -401,6 +401,7 @@ static int berlin2q_pinctrl_probe(struct platform_device *pdev)
 
 static struct platform_driver berlin2q_pinctrl_driver = {
 	.probe	= berlin2q_pinctrl_probe,
+	.remove = berlin_pinctrl_remove,
 	.driver	= {
 		.name = "berlin-bg2q-pinctrl",
 		.of_match_table = berlin2q_pinctrl_match,
diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berlin/berlin-bg4ct.c
index 0917204..f91eaae 100644
--- a/drivers/pinctrl/berlin/berlin-bg4ct.c
+++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
@@ -491,6 +491,7 @@ static int berlin4ct_pinctrl_probe(struct platform_device *pdev)
 
 static struct platform_driver berlin4ct_pinctrl_driver = {
 	.probe	= berlin4ct_pinctrl_probe,
+	.remove = berlin_pinctrl_remove,
 	.driver	= {
 		.name = "berlin4ct-pinctrl",
 		.of_match_table = berlin4ct_pinctrl_match,
diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 76281c8..0774973 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -26,15 +26,6 @@
 #include "../pinctrl-utils.h"
 #include "berlin.h"
 
-struct berlin_pinctrl {
-	struct regmap *regmap;
-	struct device *dev;
-	const struct berlin_pinctrl_desc *desc;
-	struct berlin_pinctrl_function *functions;
-	unsigned nfunctions;
-	struct pinctrl_dev *pctrl_dev;
-};
-
 static int berlin_pinctrl_get_group_count(struct pinctrl_dev *pctrl_dev)
 {
 	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
@@ -203,6 +194,26 @@ static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
 	return 0;
 }
 
+void berlin_pinctrl_free_funcgroups(struct berlin_pinctrl *pctrl)
+{
+	struct berlin_desc_group const *desc_group;
+	struct berlin_desc_function const *desc_function;
+	int i;
+
+	for (i = 0; i < pctrl->desc->ngroups; i++) {
+		desc_group = pctrl->desc->groups + i;
+		desc_function = desc_group->functions;
+
+		while (desc_function->name) {
+			struct berlin_pinctrl_function
+				*function = pctrl->functions;
+
+			kfree(function->groups);
+			desc_function++;
+		}
+	}
+}
+
 static int berlin_pinctrl_build_state(struct platform_device *pdev)
 {
 	struct berlin_pinctrl *pctrl = platform_get_drvdata(pdev);
@@ -210,6 +221,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	struct berlin_desc_function const *desc_function;
 	struct berlin_pinctrl_function *functions;
 	int i, max_functions = 0;
+	int ret;
 
 	pctrl->nfunctions = 0;
 
@@ -220,9 +232,8 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	/* we will reallocate later */
-	pctrl->functions = devm_kzalloc(&pdev->dev,
-					max_functions * sizeof(*pctrl->functions),
-					GFP_KERNEL);
+	pctrl->functions = kcalloc(max_functions, sizeof(*pctrl->functions),
+				   GFP_KERNEL);
 	if (!pctrl->functions)
 		return -ENOMEM;
 
@@ -265,17 +276,21 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 				function++;
 			}
 
-			if (!found)
-				return -EINVAL;
+			if (!found) {
+				ret = -EINVAL;
+				goto free_functions;
+			}
 
 			if (!function->groups) {
 				function->groups =
-					devm_kzalloc(&pdev->dev,
-						     function->ngroups * sizeof(char *),
-						     GFP_KERNEL);
+					kcalloc(function->ngroups,
+						sizeof(char *),
+						GFP_KERNEL);
 
-				if (!function->groups)
-					return -ENOMEM;
+				if (!function->groups) {
+					ret = -ENOMEM;
+					goto free_functions;
+				}
 			}
 
 			groups = function->groups;
@@ -289,6 +304,11 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	return 0;
+
+free_functions:
+	berlin_pinctrl_free_funcgroups(pctrl);
+	kfree(pctrl->functions);
+	return ret;
 }
 
 static struct pinctrl_desc berlin_pctrl_desc = {
@@ -326,6 +346,8 @@ int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
 						 pctrl);
 	if (IS_ERR(pctrl->pctrl_dev)) {
 		dev_err(dev, "failed to register pinctrl driver\n");
+		berlin_pinctrl_free_funcgroups(pctrl);
+		kfree(pctrl->functions);
 		return PTR_ERR(pctrl->pctrl_dev);
 	}
 
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index e9b30f9..a50686c 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -13,6 +13,17 @@
 #ifndef __PINCTRL_BERLIN_H
 #define __PINCTRL_BERLIN_H
 
+#include <linux/slab.h>
+
+struct berlin_pinctrl {
+	struct regmap *regmap;
+	struct device *dev;
+	const struct berlin_pinctrl_desc *desc;
+	struct berlin_pinctrl_function *functions;
+	unsigned nfunctions;
+	struct pinctrl_dev *pctrl_dev;
+};
+
 struct berlin_desc_function {
 	const char	*name;
 	u8		muxval;
@@ -61,5 +72,15 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
 int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
 				const struct berlin_pinctrl_desc *desc,
 				struct regmap *regmap);
+void berlin_pinctrl_free_funcgroups(struct berlin_pinctrl *pctrl);
+
+static inline int berlin_pinctrl_remove(struct platform_device *pdev)
+{
+	struct berlin_pinctrl *pctrl = platform_get_drvdata(pdev);
+
+	berlin_pinctrl_free_funcgroups(pctrl);
+	kfree(pctrl->functions);
+	return 0;
+}
 
 #endif /* __PINCTRL_BERLIN_H */
-- 
1.8.5.6


-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850

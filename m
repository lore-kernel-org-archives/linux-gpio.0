Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED836D9E9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 05:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870313; cv=none; b=Vzv6TPbFx9sCndMgqPaP6QKvNxfDehdZUNgEjwWolJLGPeiH9pnMDaSolQ163mkzpTi1Z4Mucc9cZ7CK+8Oj1tO6sk8rnt8XeQul6syFErL/kSVFQWiBk8jkCccD58RLuQ/J5roTsrtO5AkDJJS6/Co4e2GgxdDCCfYN0mLxPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870313; c=relaxed/simple;
	bh=LC/tF+SJ0o+3rLpABoFV3zi4hKRMRZCEK2RWPubgKW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOoiPQNR9dJklUMr/pg0xNkqQbjSUsZEX1NkB5c2BRMR9MvWaUPRrJwGt+FiPK2afgV48oG9Nuj6G0E+b2AHols7R/Gu4M/UfeEud6TXBKceCt7KAbRIE3+wVOKxT8iObyAN+zGvd68ovLeX6CfTC2cMvNtdxny8yYUES8dWpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/+9G/e5; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/+9G/e5"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so39248a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 22:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784870311; x=1785475111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzBDLNLA19S8f3nR2qzI1r37d0vFpqagm7xz3Oys+OM=;
        b=h/+9G/e51uEq0q0oUxkhB0lmXRS0b1G6V28JjPsB1/MqjFj9HHXqcD4Mc380njv8p5
         +54ivpCuf7hsCmx+bixjBUWIzTXSpMbtZtc91dEYzhOGFcY1dy/PF4+nwkyBJKbPoZIj
         IPYmO0gDuyA08bihty2YV7zW6W6RHoTa6nM4nFsCs0JTwBwrlEwZWhMF8EbwWjK2dg/y
         Ov6+Zb3zae0MssZ3/Mmqa3IlTnpxToBfeeblnJFNbxX0bR+jOtmEfX1s4lQixMksU5Jz
         OkQSb8RJOBt1GvfADONikgyTPPw4fAdDRJxnrAHXK5CHsormZrugv0+VpCfgn8zxMAvD
         cwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784870311; x=1785475111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzBDLNLA19S8f3nR2qzI1r37d0vFpqagm7xz3Oys+OM=;
        b=Q/tPAzGCd/xcICuO+ni1Xj1pqVzHbUgjcsCByMJKXKAxWrctUig3lbZY/i1lkwEUnv
         AapKWRZIs08aFKjbtajVtw30fIN0lmVp+SlX+OGl+yEg4lBM1t5TdxWfYDUMkh9EHFAm
         HDPb2rYQ9nEoiNOatQE6njokl2uhPV+PjnJLBeUaSCk6GvkrE8YPaFfYxTt9mX0WT2b4
         jomyiMPbRv9peP31o5Yn01RiDjM3AHmELSthVKagbhsmPLic04l96SfllftBkxqMxABA
         4X5WpA187iRHS4o8b78FSowNbUpg32Ac5Uu29cRkJFqgE7nrA/Ckm0IHogikRel/KaSj
         uuWQ==
X-Gm-Message-State: AOJu0YxiCcOZQjgDccRfpVXZc2LtIkf46DEXF/oaZYV6pk8GJs1AbmgE
	nsnHH8GYeP/rkMBNPZV6gVAaQYyoCogj3uwhK01EYrrVtGL+/n80pDvd
X-Gm-Gg: AR+sD10fsCw09FFHVVZjvkeOCOOexdt+FjufvkfbGK47eMMQWnRDGzXwqMeF8PXtS0J
	AZAWLqUIJXJy8Q9Yv8uO6xkkbl2+N6QG4vBkCkDglbwtH4XAMZoUiVG6QxNe6pXAUtBm82GxZz5
	bDw2h8UF2/4xB2MSIOBsDdktk/pUxWtpaM3IWQq2fAEj9NeNmqXns3k3GQ3PgDndFZaiMZG195C
	3kVgXRCJDg2nuK7rS1FXQ4IAGP0TvUQ4gLUDBUe7gLD0SdIKUA3+c1vdeGtna8ISkeIMn5V3p2j
	AbOtBGXpwv7jR7RovryHlMjoZwqTAoZxZ/Qfo/AU605GM3fQFnjPm8JGMPnH7E7YZm8YbRJNr9x
	5FulREvoYsXkKKRMcm6sI3GenXbYXeTO130diBu1yuNz9RrwFdjD7OeGtDHQoB8u363PCDm6RJd
	XGfZd5LZkOyx0SCqiMLl/bjlu0SLSGqhrtUcp8WP1iXRJV54gsDYi3nAhMOOzTMpsa
X-Received: by 2002:a05:6a21:608a:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3c44b1c8572mr6522139637.38.1784870310933;
        Thu, 23 Jul 2026 22:18:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f5d:dfe5:9bb9:71ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm19974430c88.10.2026.07.23.22.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 22:18:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] gpiolib: of: clean up formatting to pass checkpatch
Date: Thu, 23 Jul 2026 22:18:21 -0700
Message-ID: <20260724051822.3545532-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724051822.3545532-1-dmitry.torokhov@gmail.com>
References: <20260724051822.3545532-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up parameter alignment, line wrapping, and parenthesis formatting
in drivers/gpio/gpiolib-of.c to make the module pass checkpatch --strict
without warnings or checks. This helps when one has checkpach configured
as a linter for their editor.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: no changes

 drivers/gpio/gpiolib-of.c | 46 +++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 128402431607..1d27689b71a1 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -135,8 +135,8 @@ of_find_gpio_device_by_xlate(const struct of_phandle_args *gpiospec)
 }
 
 static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
-					struct of_phandle_args *gpiospec,
-					enum of_gpio_flags *flags)
+						      struct of_phandle_args *gpiospec,
+						      enum of_gpio_flags *flags)
 {
 	int ret;
 
@@ -333,7 +333,7 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 		if (of_device_is_compatible(np_compat, gpios[i].compatible) &&
 		    !strcmp(propname, gpios[i].gpio_propname)) {
 			active_high = of_property_read_bool(np_propname,
-						gpios[i].polarity_propname);
+							    gpios[i].polarity_propname);
 			of_gpio_quirk_polarity(np, active_high, flags);
 			break;
 		}
@@ -415,7 +415,8 @@ static void of_gpio_flags_quirks(const struct device_node *np,
  * in flags for the GPIO.
  */
 static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
-		     const char *propname, int index, enum of_gpio_flags *flags)
+						  const char *propname, int index,
+						  enum of_gpio_flags *flags)
 {
 	struct of_phandle_args gpiospec;
 	struct gpio_desc *desc;
@@ -425,7 +426,7 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 					     &gpiospec);
 	if (ret) {
 		pr_debug("%s: can't parse '%s' property of node '%pOF[%d]'\n",
-			__func__, propname, np, index);
+			 __func__, propname, np, index);
 		return ERR_PTR(ret);
 	}
 
@@ -967,8 +968,8 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		 * This is why we parse chip->of_gpio_n_cells + 1 cells
 		 */
 		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges",
-				chip->of_gpio_n_cells + 1,
-				index, &pinspec);
+						       chip->of_gpio_n_cells + 1,
+						       index, &pinspec);
 		if (ret)
 			break;
 
@@ -993,7 +994,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		 * right instance.
 		 */
 		if (chip->of_node_instance_match &&
-		    (chip->of_gpio_n_cells == 3) &&
+		    chip->of_gpio_n_cells == 3 &&
 		    !chip->of_node_instance_match(chip, pinspec.args[0]))
 			continue;
 
@@ -1006,12 +1007,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		if (count) {
 			/* npins != 0: linear range */
 			if (has_group_names) {
-				of_property_read_string_index(np,
-						group_names_propname,
-						index, &name);
+				of_property_read_string_index(np, group_names_propname,
+							      index, &name);
 				if (strlen(name)) {
 					pr_err("%pOF: Group name of numeric GPIO ranges must be the empty string.\n",
-						np);
+					       np);
 					break;
 				}
 			}
@@ -1028,41 +1028,35 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 			if ((offset + count) > chip->ngpio)
 				count = chip->ngpio - offset;
 
-			ret = gpiochip_add_pin_range(chip,
-					pinctrl_dev_get_devname(pctldev),
-					offset,
-					pin,
-					count);
+			ret = gpiochip_add_pin_range(chip, pinctrl_dev_get_devname(pctldev),
+						     offset, pin, count);
 			if (ret)
 				return ret;
 		} else {
 			/* npins == 0: special range */
 			if (pin) {
-				pr_err("%pOF: Illegal gpio-range format.\n",
-					np);
+				pr_err("%pOF: Illegal gpio-range format.\n", np);
 				break;
 			}
 
 			if (!has_group_names) {
 				pr_err("%pOF: GPIO group range requested but no %s property.\n",
-					np, group_names_propname);
+				       np, group_names_propname);
 				break;
 			}
 
-			ret = of_property_read_string_index(np,
-						group_names_propname,
-						index, &name);
+			ret = of_property_read_string_index(np, group_names_propname,
+							    index, &name);
 			if (ret)
 				break;
 
 			if (!strlen(name)) {
 				pr_err("%pOF: Group name of GPIO group range cannot be the empty string.\n",
-				np);
+				       np);
 				break;
 			}
 
-			ret = gpiochip_add_pingroup_range(chip, pctldev,
-						offset, name);
+			ret = gpiochip_add_pingroup_range(chip, pctldev, offset, name);
 			if (ret)
 				return ret;
 		}
-- 
2.55.0.229.g6434b31f56-goog


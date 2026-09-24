Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DBA4A7CA7
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265836; cv=none; b=TM/+qPgoa5lCn7VclkVqM9E3428OYJ7NP6BSpecEqb5vbIkHhcDFJHb3RH2TRPzqzZ9o033TRFks+Je6qlV27Uj/mMSI5pLLDz/M8bD7LOQzQZ3Upjr05tTlNArSaT+Bvwx6dmFuedEmZfJwOJNUzKc4paNBhbhIzTS8CFEPMFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265836; c=relaxed/simple;
	bh=+ImNRiYiTLbKVevPlQFjNy8bzZk7R2YqiBVFP/grL5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BKnLZmxuejM8mBibDplLRejwQ7DcmzmbAyEAVFFkXEX4658yMiQs88X5G79WgDqp5QlklPa51gNNsROPv5czrdhN78QjBkfonelT1h2ZJkcRQNQw4T91MrsanC5CchVG52vnaMaE9bdnMj4YOjuuah3ojJeUyLdrsK8CCGNxOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=gGFXPIzl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="gGFXPIzl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso15698905e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790265833; x=1790870633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TngWDJhbDA5h95PrbeC4iYdDqTWn3YG4eVau/z7v+KM=;
        b=gGFXPIzla+JbpixMFTfOas10lHGnPWec/To5sY+8NgV6jw1nDlv+4Uc0AvelI+2cbh
         8ELQDi/dmqe+jMm0EisFzGySkNqcv7l3CCKZYTdHAUciKUPUgBwWWLJTtTotVkhy173O
         q1RSk9Pn/c5bU/941V0XL4pqeFU8+pbbI6rw0FQtcbN8JhibJ32JFaIt8Hj6Io05YG4u
         Gp91oeVoaLxCg6xr9SCEOdgUPPfEgehI2IOJv/7gKkY1ZfElNdaizqCOqznbYsEOGy6C
         exTd7Zlhtxme2AvSlUvxMAHD+ZgKbnGdXs4Zum7dIH39Q26fuEZHkN11MHU9Bb7Ek1Ug
         g0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265833; x=1790870633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TngWDJhbDA5h95PrbeC4iYdDqTWn3YG4eVau/z7v+KM=;
        b=aYF1s3O+h6BM3DIVRDY9X89VF2SEzaQNIL8TjNzGi4iXpYU2WnB0cJ8edIGLm4fmoK
         s6JV5SvoPvcEl7ao1lTJw8Eaae/1k4FZ+QFCQwSLN6xGeB9UVNm3GVj14E9UhOAHtM9r
         grdfmNpkfn+7JhAKVIEwaUGWOgid28/gMcF1H/WFIS9s5l9pJ/IgE+HlCelxvcom7Aof
         YmG/Gw0nrSgLDqITiN6hB8nxZZMcnEa1iv13rWO1KvgD2wKyGq333twbjWpx2MDcvodT
         gPk2bbvUOQoD6ehwJYMH47IKIlF/3BY3rprKkf1Kr0MyFEwgMjSdYVNDgknEtS9556rt
         cC2g==
X-Gm-Message-State: AFuF++lF8XPaN8yWK5/9ZyniUN5D8cqoXPU3n6c/sQj8+DbufxZN1gtj
	cZZxQHnK8oGmHFEjnqPcOP5EwFojfktA2K7FtN085DfZZq+T1kVsR0vBtrhvqc/pZfWSC4PNfWc
	9Vhn9ZUY=
X-Gm-Gg: AYBFou3gtB0PvCnoo8S3zXCQnmeufaekVQ7CjtrmOo+vcuoHKPs00hiNgjFVGEi69KC
	g9dwXo+1A1vNViUjm7cZgC9QaNFbE4xfWZeZENe4m7vbnqWOaFmcZpDlinoBYDHCHXC+MMGQC+0
	UUPr6ZwVFiexwsR2De3UbzWfLCqoD0YziV3ZGZBAZ84oR0k9zwhc7C7kGG4hXztOwG0wmd4BBOX
	34hY4DjUPlEaY9IeOC8rltR59IQty5Y1Gd0GWWeb4ABVbbwl7MvgsiIdLjYujfrl3nIXceM9UMn
	unnOUqHgedxgGbEUP2XzAPRQdTmR8qaBdaktvc8k2x9Rgf7RJgQvKrfPz6e4x0Fjv3tImy98Y/S
	L3y/OgXLZyJM/AtVfpKsQdFh5SJllBsBmhYn1sPuNj3QDrEAMra6gX4bI56Zl/KTpCz+/9mFNKX
	T0zlUP4StjcDG37HAPy35m93h0gxocblF9swa8SQs9LMC+GlmtTGr8MlKhUKU5na1CV/KADNOyl
	GTSGbTH8jKLc3NcfAgSNfjWNFNWboADNfv/
X-Received: by 2002:a05:600d:644e:10b0:49f:e3d4:4c1f with SMTP id 5b1f17b1804b1-49fe7b62d1bmr33379555e9.8.1790265832549;
        Thu, 24 Sep 2026 09:03:52 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm75591605e9.13.2026.09.24.09.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:03:51 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	wellslutw@gmail.com,
	dvorkin@tibbo.com,
	linux-arm-kernel@lists.infradead.org,
	Andrew Gaylard <ag@ffroot.co.za>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: sunplus: fix kernel-doc parameter descriptions in sppctl.c
Date: Thu, 24 Sep 2026 18:03:44 +0200
Message-ID: <20260924160344.109727-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter descriptions to kernel-doc comments for
sppctl_func_set(), sppctl_gmx_set(), sppctl_first_get(),
sppctl_master_get(), and sppctl_fully_pinmux_conv(), fixing all
W=1 kernel-doc warnings in this file.

Improve the phrasing of some the other comments in this file, while
we're at it.

The warnings for sppctl_func_set() (@val) and sppctl_gmx_set() (@pctl)
were newly introduced by commit 7dcf87d2dbbe ("pinctrl: fix
PINCTRL_SPPCTL=m"); the rest were pre-existing.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609240204.VHoUp5qw-lkp@intel.com/
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/pinctrl/sunplus/sppctl.c | 45 ++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index 67e036d66245..8a3fb9b56597 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -149,27 +149,30 @@ static inline u32 sppctl_prep_moon_reg_and_offset(unsigned int offset, u32 *reg_
 
 /**
  * sppctl_func_set() - Set pin of fully-pinmux function.
+ * @pctl: SP7021 pinctrl driver data
+ * @func: function number of the pinmux pin
+ * @val:  value to write to the control-field
  *
- * Mask-fields and control-fields of fully-pinmux function of SP7021 are
- * arranged as shown below:
+ * Mask-fields and control-fields of the fully-pinmux function of
+ * SP7021 are arranged like this:
  *
  *  func# | register |  mask-field  | control-field
  * -------+----------+--------------+---------------
  *    0   | base[0]  |  (22 : 16)   |   ( 6 : 0)
  *    1   | base[0]  |  (30 : 24)   |   (14 : 8)
  *    2   | base[1]  |  (22 : 16)   |   ( 6 : 0)
- *    3   | baeg[1]  |  (30 : 24)   |   (14 : 8)
+ *    3   | base[1]  |  (30 : 24)   |   (14 : 8)
  *    :   |    :     |      :       |       :
  *
- * where mask-fields are used to protect control-fields from write-in
- * accidentally. Set the corresponding bits in the mask-field before
- * you write a value into a control-field.
+ * where each mask-field protects its control-field from accidental
+ * writes. Set the corresponding bits in the mask-field when writing a
+ * value into a control-field.
  *
  * Control-fields are used to set where the function pin is going to
  * be routed to.
  *
- * Note that mask-fields and control-fields of even number of 'func'
- * are located at bits (22:16) and (6:0), while odd number of 'func's
+ * Note that mask-fields and control-fields of even number 'func's
+ * are located at bits (22:16) and (6:0), while odd number 'func's
  * are located at bits (30:24) and (14:8).
  */
 static void sppctl_func_set(struct sppctl_pdata *pctl, u8 func, u8 val)
@@ -206,9 +209,14 @@ static void sppctl_func_set(struct sppctl_pdata *pctl, u8 func, u8 val)
 
 /**
  * sppctl_gmx_set() - Set pin of group-pinmux.
+ * @pctl:    SP7021 pinctrl driver data
+ * @reg_off: register offset from the base register
+ * @bit_off: bit offset within the register
+ * @bit_sz:  size of the control-field in bits
+ * @val:     value to write to the control-field
  *
- * Mask-fields and control-fields of group-pinmux function of SP7021 are
- * arranged as shown below:
+ * Mask-fields and control-fields of the group-pinmux function of
+ * SP7021 are arranged like this:
  *
  *  register |  mask-fields | control-fields
  * ----------+--------------+----------------
@@ -217,9 +225,9 @@ static void sppctl_func_set(struct sppctl_pdata *pctl, u8 func, u8 val)
  *  base[2]  |  (31 : 24)   |   (15 : 0)
  *     :     |      :       |       :
  *
- * where mask-fields are used to protect control-fields from write-in
- * accidentally. Set the corresponding bits in the mask-field before
- * you write a value into a control-field.
+ * where each mask-field protects its control-field from accidental
+ * writes. Set the corresponding bits in the mask-field when writing a
+ * value into a control-field.
  *
  * Control-fields are used to set where the function pin is going to
  * be routed to. A control-field consists of one or more bits.
@@ -242,6 +250,8 @@ static void sppctl_gmx_set(struct sppctl_pdata *pctl, u8 reg_off, u8 bit_off, u8
 
 /**
  * sppctl_first_get() - get bit of FIRST register.
+ * @chip:   GPIO chip data
+ * @offset: pin offset within the GPIO chip
  *
  * There are 4 FIRST registers. Each has 32 control-bits.
  * Totally, there are 4 * 32 = 128 control-bits.
@@ -271,6 +281,8 @@ static int sppctl_first_get(struct gpio_chip *chip, unsigned int offset)
 
 /**
  * sppctl_master_get() - get bit of MASTER register.
+ * @chip:   GPIO chip data
+ * @offset: pin offset within the GPIO chip
  *
  * There are 8 MASTER registers. Each has 16 mask-bits and 16 control-bits.
  * Upper 16-bit of MASTER registers are mask-bits while lower 16-bit are
@@ -285,9 +297,9 @@ static int sppctl_first_get(struct gpio_chip *chip, unsigned int offset)
  *     :      |      :      |      :
  *  master[7] | (127 : 112) | (127 : 112)
  *
- * where mask-bits are used to protect control-bits from write-in
- * accidentally. Set the corresponding mask-bit before you write
- * a value into a control-bit.
+ * where each mask-field protects its control-field from accidental
+ * writes. Set the corresponding bits in the mask-field when writing a
+ * value into a control-field.
  *
  * Each control-bit sets type of a GPIO pin when FIRST bit is 1.
  *   0: a IOP pin
@@ -679,6 +691,7 @@ static int sppctl_get_function_groups(struct pinctrl_dev *pctldev, unsigned int
 
 /**
  * sppctl_fully_pinmux_conv - Convert GPIO# to fully-pinmux control-field setting
+ * @offset: GPIO pin number to convert
  *
  * Each fully-pinmux function can be mapped to any of GPIO 8 ~ 71 by
  * settings its control-field. Refer to following table:
-- 
2.53.0


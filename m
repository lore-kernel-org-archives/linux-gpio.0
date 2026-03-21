Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E259F2E889C
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088025; cv=none; b=rs0YRIXEXU6F/pYMwSnX1BJRR7o1Ud50Ns3pFHSlPKISFDa3SYWD8l1KberyPXtV3K1D5jtH/QCBfUCwqGy/jolmnQChcmgVLZZbfWMxUGwFBhe4SuNebETssQr3rTq6Z5hOA3SABGAWpBxTazr+aUG16vuN7ir4kr+Tvl5n0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088025; c=relaxed/simple;
	bh=kgwtkoVu4mddoqE/ts7AvsOCdb0qDdCgFAlVSNZPAZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tx+WcBg8RU3XWs2t6ktHQn+SSl3BQ+cgFfznax579ZMTsngvpnJ5Escll/JmNvWJhYFthHIma4e7v5FjmdywApL0FoRFGjyZYRyqLPKnpD9YqQmRIBu8cLtLVfIY3AjhX0CxYj1ARxer2KucY9YZpwQyJwMFULr8HI90ZkDYdIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uAMsPja2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uAMsPja2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8df7620so1739652f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088022; x=1774692822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQNlAf6vdnJiKr80lkdqTbyIfJO8B2GTTG5cZRsC5qE=;
        b=uAMsPja2xf3K/nXD8oWuXKsENoEhRo/SdTkIaE2NoQtr3EpH3ha7m4MtAxGxHOleNa
         2o3bjx10oHxDl981cMAn+NTWX339foadIhVjhC7wRnGzN0pF1DYT+i1rtiiMf0TfRMbU
         ofLZzBeWt9JgtQ3H3w6RAYJpCQNDOCvyJe2SzI5Zpwi8dnM3/lNnoHLJnBbvZqOyXW6P
         +QG17zdJM8DqUyAvZvH+o9M1xasDTllCx2iFhP0eWhbwML+3YPWhjKE/gpByqLHrcUY9
         goMXja/M7Z1iHb0pCIbIaVXLX/aBnuVPJwPojsUnRw2tDrNqwfqMMFt25Mx+8Rc0L7gv
         3xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088022; x=1774692822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQNlAf6vdnJiKr80lkdqTbyIfJO8B2GTTG5cZRsC5qE=;
        b=N7hg1hiBlUwSgYoP3ZB50EmUA3IZrp3NkituJ7i4QYl2g6b3pGGw6Y6WbhKcLrqeR2
         4+lEBxOmj4nobO/x2b054+kcM/75hicJJcCVeDH6E8bZugfRcjzD8MJJzOFBkCu27OCf
         B2m2ip3uUpeVMvNe/7cjTYY701dCoXKhsFjlVyPUJEUFTmGQm+Yc9QK740zzy4BmcOdO
         3Ep4Ayjcer/MS08QjQd5H1pFoQ7EgNxxMwvDW/X9dgWWrSltjNoaaLJ+/HHiT0tlHO84
         3gmfUM1Vvv8gEGCXZXpc5d2Xaa8Nn8JbJVL0WdDtuLWIu0+zmq2pUK/hMYREIiW8vAMO
         LXyg==
X-Forwarded-Encrypted: i=1; AJvYcCUn/bUYBK77BhHVCp4Ap9Yd4YFnD+FTnBQyNPqi9iPtfwp5zFq7bx+CJaognexzKnWAjL9XTJjDUdKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHww1VtZxjWG8VAgclxuO5skApdGQUy8yBridR4DCC/rRMf9k8
	7IfGe3EaU8wfDteKSc1/QTq5GZ2HwW+LD3TeN6b/PLJ+15czSk/r64HPFqM4u2WFCz0=
X-Gm-Gg: ATEYQzwjoytVPI44bDdutUnANzRW4n7IjpiHoC6iaCNmO++dQK5HqkfgFhEHH5aXQ/I
	ziGa4uY1tq+DTsyh+j6MUPP84h1nfWgPHCLb29yXLcwogTDO13VICBdDoEtqxpInWHkx4Dj3oBA
	TIOj1bLS4JJW2RprEVCNkbrVeUeWGyjLNnHVCowi5iO23ty+A5mHkv/6MaECSLyrUIiFpvkDK7Z
	gtyHqTGxwl9Yjt7aywVvwbfr8yLM1N2vmu1LOdf9DcSRLHiPn0ln40ITaa8Y1t4RgHEhNTyuh7b
	fZm4SBir73QhnudjK2xxn3ZYkc5FfDrdDx0qVGbeesu/LjFoLLOTgDUMl6nRXqk1qwOcaIzshHP
	e1QabysS3fquYcdGDR8mB2UCQb1mYieI4vu3vJekrT4TmXEq4awfJkFmlGwcFhgfg+NxbWD2O6I
	fm8Q+S8qJUKK//LWyP8L5tL2ImxMWRKH6l4brkQIU=
X-Received: by 2002:a05:6000:420c:b0:43b:460a:b13 with SMTP id ffacd0b85a97d-43b64281506mr9452939f8f.44.1774088022148;
        Sat, 21 Mar 2026 03:13:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm13473541f8f.18.2026.03.21.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:41 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 3/7] pinctrl: scmi: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <955306193a128db29f62a4a3261a1d67561834a8.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
Sorry, Peng Fang, I really thought that if I put CC: Peng Fan in the
patch it would CC you but up to now it hasn't!  I should have noticed
that.

v5: fix subystem prefix
v4: add r-b tags
v3: new patch

 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5d347e6b2e4c..de8c113bc61d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -254,9 +254,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.51.0


Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837F3B8405
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 23:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785668; cv=none; b=O5pyDfMcGiwB223DtFEar24PIqVZHlOovo9qBysahvc5XSvzlyaF19VhVZji9c3/FajnxrM6eZj0R2DTLM6GemJ/Lza4e6g0ee4qk+VIgYGOH1hrnesYl+0/Ex8VNjrqmYFwWKWaGrw6hHYp8qzhohXSeDUj2OSZx4T5ncnco9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785668; c=relaxed/simple;
	bh=6EgQ4h8sCnpkkI8smYfsOfZ3mX7SDEKGdmQqZFbaaew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WB2mm8K0bXIw5gDwD3WnhP2PLwVYX+YzSgYqowmJbOj12J06pIlXD7k5HyOuqf+XxfUGJiXB1EQyAzxtDJ726cL2BHI6spSN8D88Vpayh8HCIG6X6Zql1k9bYsJCSZJ0X9K/zk2Mfe/T1A/PhYDzL7WNwt2j6KlVmXM8EZNJgiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUT3ie43; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUT3ie43"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso821551241.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 16:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787785666; x=1788390466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz31B2dhBshUWYNwR3Q8xs3ULxEyjpdBo/IUGet1XKc=;
        b=JUT3ie43578qIE7KBSwQLn7EiLFiVKUxt0x1CE4+SCmBrQ9UMVEU2pijWnNLN4BY21
         KA08B9eDVoH5T1j9SBtQFHC3VmRbJWEZjTx5PwRgA3GIf+SXd/2Pd1GQo4S+MBSR1zIz
         kbJ48M/lYa9SVvigfZITPwfipZrK4K9h1nxAs+yZXkMDzc0PFOmGzxPTals/e2Eiiytu
         fXHhq6rV1w5EnOvRbAeJFc3013bb4tCTN0ildRQGhg+AU7LBQglOMP9YO7zbrRfbM+bq
         mfX6WY8WyYVw8URW89zTto1VhLQCvHlSQ9+kRkP/cCyySEpuO6k1rSZLAi3CKp2RenmX
         ljUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785666; x=1788390466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz31B2dhBshUWYNwR3Q8xs3ULxEyjpdBo/IUGet1XKc=;
        b=q/44xiY8xafDRgUHJnt8xmmoMggWmVaPD3KHgjAQazDS9HaWoQOqCJxUkcuxDpCFw1
         yfNpglEjOzsRZjwf/3UkRZ+3CWKOntbrbCnMLy94RYHmpy7Pv5ZxQcAaMQMcBx7OpgmI
         BBQRN/2Xe59/QX7Gv8NWvFs9O+o03Wb/+85NGgoriTlZ/GJ0UEDRRTGpJPnIPIcyB6ZO
         szQoGjqFQHZWm/IzShFh8EayewJ6F2OcZxaqX1aNOd4A4fmoZoI8sGPRbv8BxxoPdFn3
         uXVk5TEzlwGyV8VIXuJOoKCHwlAhtXL64iTgNkFbuF7DJcoY+DwGe8hP4CFJgeUYvg73
         L5eQ==
X-Forwarded-Encrypted: i=1; AHgh+RofN9eUu9r+ft0sAWElzO1mCO3diB8pj3Y/qMhMrS9V5al2I8ddXi1cEXz2ENJCihzTBYqqtTVMPADK@vger.kernel.org
X-Gm-Message-State: AFuF++nx95wR940sxmX0H+BZujkPo0yhbJzQg9M6aLdq0RSPATVb7WmJ
	7ZZwz0jXTOAaAr6eRxvMLxwDez0IID/bRqnkgMuqHfSOUmFQ1vX7OlxUv/CM2bcs
X-Gm-Gg: AR+sD11HlH1zm7yWaNx3cHZUIL71SF45klJdhN3Gs+Py8jfXviMPkWvcpx1Oce731XP
	9FcLWTT9kU6h9gPePsyZodNk2BiRON+vA7A63Ic1VzehL6uFIiWibUMs+Se0wjfp9o1I2GYHMd+
	wp7zoYpeGT8QyywqFEeEy1ibUYlvZJjrSTBRmzq4BaA+LPT4nvOqUY820XVSFEmMY0qS+EbEjlY
	oWlF/LuUDvjINWetEUmt9j3QN+itrU71opJ4k1ENy/C6lDMNhpw6qXZtXj80h4ZEo4VTpoAjBG8
	5kTlyiY4Uf/RwU5bXNmr3aoGJTYYcUA3TMOhrj0/PCHtPmtAl2fnKv7LJHzri4RlvkYanYc92mf
	Q1Lg+VebW/r17cudx+nLG6CuLWD9BY1rm8Kq6XAOjNCJSQOXjKQPaQgEn7XAO35xFWZVf3jTf/D
	A7ZBJL3Xm6U+Ts32hLJMs9PsJQbktALCWN5ujZKc3w2IzDmgzcXZwUCtjZ+MtfYDVNBLkXN1Q09
	On/eW8MoEFsDxHFP00gu/vcO0kSTevTeippWa2uDGCUrgjPDyrFy0hn1vjMkr5ePuRA1UwSVcFH
	Mdrg0Qk=
X-Received: by 2002:a05:6102:162a:b0:77b:28c1:210e with SMTP id ada2fe7eead31-782bf9bca7cmr4267611137.1.1787785666335;
        Wed, 26 Aug 2026 16:07:46 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe0ae5d2sm3311701241.2.2026.08.26.16.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:07:45 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Wed, 26 Aug 2026 20:07:16 -0300
Message-ID: <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

This series no longer applies to mainline. Patch 1/9 fails on current
master (45c13f3f9e3b), for two separate reasons - one of them from
outside the series, which is why I am reporting it rather than just
fixing it locally.

Applying the series in order:

  [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
    error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.c:1521
    error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.h:88

The blocking one is your own patch 2/9. It merged as 42e06688c6cb
("pinctrl: sunxi: pass down flags to pinctrl routines") without 1/9, so
sunxi_pinctrl_init_with_flags() now reads

	pctl->flags = flags;

where 1/9 still expects

	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;

as context. A 3-way merge does not resolve it - both sides touch
adjacent lines, so it conflicts.

The second is unrelated to your work. 70f8915ea4e9 ("pinctrl: sunxi: fix
gpiochip_lock_as_irq() failure when pinmux is unknown") inserted
SUN4I_FUNC_DISABLED_OLD/NEW into 1/9's header hunk context, and added a
fifth use of SUNXI_PINCTRL_NEW_REG_LAYOUT, in
sunxi_pinctrl_irq_request_resources(). The header hunk merges cleanly
with -3, but that new use is not covered by the rename, so the tree then
fails to build with an undeclared identifier.

Patches 3/9 through 9/9 apply cleanly once 1/9 is resolved.

Static reproduction only - no A733 hardware here, so nothing in this
message says anything about whether the series works. I am not sending a
rebase: which shape 1/9 should take now that 2/9 is in is your call.

Vinicius

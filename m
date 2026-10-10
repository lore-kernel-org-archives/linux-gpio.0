Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70C37C900
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602795; cv=pass; b=uyHLaQXZR9qWEzZqhHG9/RJSdumTVF0YE0jYWKKB0Gm+c/gtEBGh+E1L/P2z207vJSF+EPChne7UKAuIHmwSa5YW/IuAbsJEMxjMtPaqIdl4WJswYO6AhCBdsTAt7Nc8iT7QEgR0Vmm8JJ1F7pYhEQe2csGMD4xTLNp44vjSUo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602795; c=relaxed/simple;
	bh=gzk/Vqa98lLR1g14dUkoIDBfibZcPrZRHRXSu0c7M0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N61rFLFACwIhcyaMNQ/KuCjiN9xGOtAwDjwmjKA68hub9VpmdQ0x9qrrCYC3NesorCGoXKWBpyBhg3t3QB+RmJ8MRv9FVqqAnTmCcz24v7L1JTw691PFVuZ+nJTtEHWhWydM7hhWyJSv0SABiEFmsKRQejvp36pIxc/6/y1ItB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+xoK7Qm; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+xoK7Qm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd76b1361dso1669295ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 20:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602794; cv=none;
        d=google.com; s=arc-20260327;
        b=hmCCdI37LpML7zEyxRK61ZLH5IKcD+kA81OBb3ll7SAtK25HlGWsfyAH0PlBf1isp4
         xWX4E4xDMM/nFPeUka6xaP9tpHKNVUy5ghw9yYZs8Q3e/wBjyS9kjk+faYB7wG293Qf2
         cF8+hhD838uJkeFTlsG1nTmvyNEfOcy74JpXlaczCwTKPsaoNwE4kk43Jt/94FxaN+HI
         5SCI3qIJWpyvrKLdyklcij0VDnD22TbPLA2cyFWKPpAuMTereswZI68Q7SmdSY5y+aeY
         dVeotfkFLN+CQ5YYGIjtefzoYqvkl8DEkPLxz1r1eBlzpB+x+62LzIY1aPI1GAJDjVJ5
         Qapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        fh=l4WydfdrPtBVsqm7PbFpy/qmrj4lzdiOjWlBUnDZyko=;
        b=OT2uzVUtpEOQKZXVhGekqE6WG5z3SkGARe4GVcrnF0O6vdx0MnBiMctz0F/63l6+Hv
         ccFlLRNBHE4ByJANePU5oedaleS1s3azSp9ygxg8eudHIxdPekJZC5Wvb8xWej3bQf5U
         o9+4jsaiGTXQvyku5sQH8NAzkaz+ECPrBitwizL8zOWdppy+BtarlS+oTFITMVdotIQ1
         ahGBm6zMTl7c2+JbK6FxbXgvp5gbKleEiDlfAljYm61PpiYoFzXi8wQyLujJcxpSoI5e
         j7Hv43AR9+Ekq2CSlYfDzFAQSQydeipr0hyKgxkGnh2K0uWfH3QSdGxwNUKYS7+CKfnx
         wBwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602794; x=1792207594; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=o+xoK7QmG4krG07EQs+M0HCVRFqFRW7EZb2N64bgOJpRzaW9FQGCfw43lySUj/pGKG
         cxcXGiadMIXGN0LadcRDY2oGWFRsi8FHdNn1s47WIUYyKqZFfXPaA+VIg5B96ksVYADT
         T1Y7jR3VsJriHQfuk0htMsH9BrvflcUKLT1K5OKNX2KXOesnMxNMSHPHM6zvsBFMZFYR
         HT1QMH3pH1BO+Q2yW4E+a0tlXuipNGfPLq9tgPLynMmK6M8SqC0+YFCJZ91ToO5S/unE
         0Z2IhDTxC21WQdtmX5eg2fAYnOQPlBhcMYfpgIx4OuiIArIY3W8k+nNU0Jivq1ajFSgD
         grjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602794; x=1792207594;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=Sm9dH9U2yLxV0XmuOhSH6pGz37CBJpJUgAV20F1u8jB9ll6lQHLkUIW0SdJYln4M7L
         wdcqhL7x3kohCkI8x9Gp7A3Metm2OUlbs2cBMUYYmAE8/1Mdm920iTHxbH2chlzjFmQY
         4b4vUT43utRsAgq8ZrUdba6tgZBl0F0aXWjk8Jri97Bm1fkluSkMrzq5TYwTUcl7spmi
         XP9lrDDYVeaacFthGT2wsKQgvFheONBamAYZVq/5EBXdAel+POw2CLgkX7F6Hpn8KVzH
         iR+XS2TL9mHm+pDY2Eh35gdZO0HZvEzE2vMEi2sMT8xcM+mZ2foXu4N6lTjPIlgIbykS
         CSWg==
X-Forwarded-Encrypted: i=1; AKwUvBwqls8CunriweWFueNMsvXzP3QhZyTQ8f1ST9HR1U40zrBWZzg5YYGeVqSF5ltnKZFtG/sbXrFMk0cS@vger.kernel.org
X-Gm-Message-State: AFq9FYIal7BXj+SNNJ7dGfHSnQHhMLLw35e19xvjzOeTiND0TH2Qxi/G
	12X89lR2VVRs/mAr8Eq7OmM2k/3k0sIYRT7ozV30ATsIGD7xoSxe8h0+7n+9yV7l+cCQPsaHWhK
	LY5OFmUyXK7u/4Q8M7cq4daR95QRfPB8=
X-Gm-Gg: AYBFou3XZYuOj1eXOsNoQtlo3uMxqdwbr9g2pdYa1bTj7SykWiV1rpeMd053mXW4v1u
	yQYwFK0ds7hioeQOZ4u3DnGx3UzSW1ThPIHoFm3YxiRwFzlisu60509limwAmJm7f40kvn67Jfr
	rstHr9miAww2G5wFK6WP7Jbtw5fmjnYwyJ9EqGzY0tiMwgsCoR9GF6R+HOcj9GPsLv+IPJGe2FJ
	NFOmnimhbQj4XhcATNq4nGBawe0jxUfRNVbiDI13g1yAsXYVklGKCQQR9ZMbkN7lKLtIv60pQA0
	aoKUd7eesksJNrfrPzUTczkbwkwGI1+ZHPdDppNlYUOpPT26LKXwZHdaK2yc/aKpifkkZZpbTj6
	lmO9fR1H3Qm/aLhBPjs5pbffBeYbkckS5EDYdNbmBFWz5PD/Giny2kO30Rz15QSf+CjiWCTXzE2
	J+paN83XG+pqTyL6vKafEla1GaOw==
X-Received: by 2002:a17:902:e74f:b0:2e5:78b1:33fc with SMTP id
 d9443c01a7336-2e842e061e4mr35918455ad.53.1791602794135; Fri, 09 Oct 2026
 20:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009112634.33436-1-phucduc.bui@gmail.com> <202610100943.RQhhOoh8-lkp@intel.com>
In-Reply-To: <202610100943.RQhhOoh8-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 10 Oct 2026 10:26:23 +0700
X-Gm-Features: AclHuK-rwA97Wy1N3y57S1OeNaWlVpoAN-_YWwiNqheegjzdeSENPlryISm6gn0
Message-ID: <CAABR9nEkjf8_dar1q4tYMgBTa0p7WzR9Qx1N4Nr_ECuNZ=hxEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Darian Biastoch <d.biastoch@gmail.com>, Andreas Kaessens <akaessens@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610100943.RQhhOoh8-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/pinctrl/pinctrl-mcp23s08.c:617:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>      617 |                 return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
>          |                                           ^~~
>    drivers/pinctrl/pinctrl-mcp23s08.c:592:17: note: initialize the variable 'ret' to silence this warning
>      592 |         int status, ret;
>          |                        ^
>          |                         = 0
>    1 warning generated.
>

Thanks for the report.

I also received a similar warning from the sashiko-reviews earlier.
I'll return PTR_ERR(mcp->reset_gpio) in v2.

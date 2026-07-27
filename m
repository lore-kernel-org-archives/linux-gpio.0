Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60C3E1736
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138822; cv=pass; b=fAuGmpJJAFU64Emeq55SiEqNc3w4NqSyOfWHvOE2P0Oxd5fkvmzkAkd6GZ8y7XdMrl9Kq5S4vqYn1CMGS7HX80GlD0oEdvvMiErAZ1PsufemIkBSUQ4YNinIRZ5afjexY9P0pEmyaW5n3yh8MnXd3sDNl0s8C0tEwGivHc0mdBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138822; c=relaxed/simple;
	bh=GtkFrz2muo4nowhBxyTYAljswLQGG8ukGH7fH6jntTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VthsOxHvkWSy2KaBnFmpW7JZGn7SEcdEqnmSyxx+ZlU24rJqHKjUyBhSjWVIphoGe2fB0s2u5EoLAaXr0WWj/Gu6BQRhR5FOdq1hPqMLCE57+MFkzZo3nNh2tlmsOEpTCE7GF+6uDH5F7BMG/lhnTaaQK+wjEX7WjFeOUtIPJU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYuOMboN; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYuOMboN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cee9b74ee1so18535545ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 00:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785138821; cv=none;
        d=google.com; s=arc-20260327;
        b=NAiJAUvfuZ8PmhMqIPXtQOk/JT5S3cHfxxgoyAsdjAA/Q0NmUhbdKU4hTZLeEDZPPQ
         +tbc2Yq5b99r8pWxiiH4XYKVi8Itv9YcxjTT4DwlUTyfXKpEH2Fyir5GZZ9maXlaqsyb
         4r2QLmeVaZQ7dineq7+L8VQ4lwzKQjFXIKuZcHQYoCwzN9hXdplx9FHq2RVUkyZep+EK
         PqJfev9BKD2ptLCNO64K8JcMDDWRnBsdiQzeyqtP1gIQ0xP19UUlC9RYWlNCo8hz31p1
         95uGYKOrMQpaaxdJAPcwcTbMP8zZ3p/FFEekyZWffJh5N9Bpn4uI26YpEntFyNhaGlXz
         +jAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GtkFrz2muo4nowhBxyTYAljswLQGG8ukGH7fH6jntTM=;
        fh=fee67FrJRkvZB6mdrmdu+grC6fEPIWUZGdqiB0UlaJQ=;
        b=ITOhmA57/WUhSsqq4ePmaLbzMkdb3ksNma1QTRZEAsQrPLj9ryI81/t8VTmX9a/GFJ
         M9OH2IsV6j1dnT1k+ls0/YmsgyJEPYubPU3T76zHfwVOi8F2i9nRSZQ9bnKp2lqJcWuE
         fCEuuF+BVNIEFBCBzL1s65HcrQxPKPpogObyyHDr8Fkj/dwgyBz+ZpkanlBJjDj8H8wa
         n19e9f+8n0FEmTPgdaVVte5WXbbuZqZJ6rgD+0oFrKPeLj8BsOWsYRGlF9un61sBUn7e
         Lgw3jtXaC+mZix65sufqIoSDULvXWCdpA+3EKNRV4FXU2lJ0qOYsZe4ZPjEFpUH7S2y8
         Q1YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138821; x=1785743621; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtkFrz2muo4nowhBxyTYAljswLQGG8ukGH7fH6jntTM=;
        b=hYuOMboNYlVcI5gjlO8e8m2kl2m+D9UtHXOyrh6F9rGkuKVsDe1MnOwrOauO/VnDhL
         vJ++Dgoq+thLQ31yi/U+Q0YNK53MvDC/rdmhN/CC6A4SoHrRPg7nKgG5Og4kGa1gV1VB
         KIAeod2okCiYCnO8a8fI8hJmoLOEmh1h+mW1WU9nsSjUAJq6R1m59kbLI0Pd407tf8fk
         /Lg7VwKCYKMVZYgTifRhoBp6o/8AwoTDWU3lXU0uOKKctDnc/g9Diyt0TCbFN0x+sIio
         snzn8Q18XTUGq7yNC7iQrglMf1cmU1O37RAJYK0P+XV+a5ivY8SZ0Kwrke6OjBpFmOnN
         5A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138821; x=1785743621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GtkFrz2muo4nowhBxyTYAljswLQGG8ukGH7fH6jntTM=;
        b=Em/KTxYZViEwHu0AVqKCftmvRPFoqCo1auRCUluGBOIRUy9qcNWZVlh1A8qvmzx5kw
         8qOmYR4acjAois8O8Qutt59+vBsO7Ef/ZTXdabyElHLE0+WWyEmZ+8DsSrwYqVTU24Ia
         tB2febgQxfTsf3vBSGLSHW8yM6znm6yDViwyQqcfjugJqoqaNNfuIFpSmfnhWoKvmr8g
         B+OLWxjrZOWUXoYxo0J/780cY+qZh1oNqzf7MPVoP4EXl+lJJe4XX1nNZ+skmJZdxcrj
         QcU5iiNzU6dY7YHAqpR7WpLSXRs8aARrKLzEDaYmALxwOx/u9NhLn1fxqoInHJvNqt3q
         RhDQ==
X-Forwarded-Encrypted: i=1; AHgh+Roe9/zbF3Fflj3n2lUl1fyD65ZGKpXLciGsDgabWUW6GLv/sa84ygT6ofjxWkDiDPA7FTmRKq73kl8s@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQVAAkeXmLFiBoFq30QPl/7lLeo9UPTW4t2FPdbxjNViaY/li
	abDaex0c1lDFZ4jIOyTg1xNtOS2uq710ceIMLklV1JlnOu4iD/kwGE49eiUk/89Q3fjuAi+HsRn
	nB7ZoIdXn6tDk1zF0u8fOcNVBvlyv9lPdASnw
X-Gm-Gg: AR+sD13UmbbmTZ51JNR6kr1grJduHGFDC6XC0Qhhb21TP4uqfneeL1SUk3Q2rrpTgI7
	NeHUQhQ1LydrvYcpRugLkxPyRu4MIb8SZSxDtmPyHuBSATxZZmsqsSiXrbd6g5SWOWZmNeCQBKh
	ylYoWXpIDNT8Ai0Yqbzuc0AKh+kyxAU6E8/z7W0k68GS5MO7IkJW+6WGiNFCewmw76taIue9658
	n2SlGVkouXsfhVWXMSlNaaOH1YqQWRtjPm9xGzLM2YF1jKQaduMYlCFGtxVWcz5CDsYQsh6pj2R
	4Lnps62gjSoAgDEx6uPpDfEBaGK0N44RFyzAS/hRA4T0m32855UGHUQfuW54UnLU6R6t4QCi+Q=
	=
X-Received: by 2002:a17:903:19ee:b0:2c8:2808:3ec4 with SMTP id
 d9443c01a7336-2cfde866afcmr67623035ad.24.1785138820811; Mon, 27 Jul 2026
 00:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724081838.33428-1-phucduc.bui@gmail.com> <CAD++jLnTn0-JRRgdwQ9JrjGPNh=xYCm383EpJ2KRHVTa62bsgQ@mail.gmail.com>
In-Reply-To: <CAD++jLnTn0-JRRgdwQ9JrjGPNh=xYCm383EpJ2KRHVTa62bsgQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Jul 2026 14:53:29 +0700
X-Gm-Features: AUfX_mwsQ7n1T9fvaq2mAo_35wKERHfhO3ok-uiZjoDu7GLtjgDCpU5pEI1wBdQ
Message-ID: <CAABR9nE84_4eqMoipq5LDJ5u+MS7Q01zdZ6Xg2W9P=oEDFTDCA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: restore cache_only state on resume failure
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bart, Linus,

Thank you both for the reviews.
I'll send a v2 shortly.

Best regards,
Phuc

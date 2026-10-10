Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036C2DC79B
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 03:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602612; cv=pass; b=S06zk2/Ku/xBz3jsBohjDpOR3JsehckQ9/BNXX5wQ2pkbDIFStskqXxBYMPxBpesO6lQh7B6em8C0XrZyGfXqGp76rhbUG4AwBt/9VZgoHCml5LuBOZux0ThUaR5/VPuTxeRaQHEO/WdkBzqLO7ga0wyxc4AX7tCf2Dv+4dVAlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602612; c=relaxed/simple;
	bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fs4yFQeaiWjJ5xN1s8cf1N4AO3O+zKkMbDjElxQz37NnJmQAnEdjc+fDtnwUcDNowUh+t7tTKTyJqm9DK/H8e0xMXaEl30AIdCy47gUywhRS/rShLk+uydXYpROqR9A8XYacVrlboNCMU+ax0UZ3xZdgZ07C50kEOFTErmNAD+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeYVMy4m; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeYVMy4m"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8714288dd3bso121751b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 20:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602610; cv=none;
        d=google.com; s=arc-20260327;
        b=D8HhYzEc6I9jGowUYhpNWED02xamAjdsBrTHWCt/HoBTiKMX8pc6ANdy0H3kNjQF1w
         AqDjL+Z6m/JmykUncKvE3EZyBlFYk7WftQbBbZHciNXN99rIPbDg/2CmLdJoT4tUXbBC
         R13ewZTk2Oq4v5Qqwd5ckKGmQB4csO0gcTjiU8NsThPxvrjYmNQyrBbGRyiKJPFprctJ
         fdBA99AnAe5nd7uVzy2hM2Mc6FymOsJeKUFXCqBZW1XQ9WYiwmS5QYz84E2s03oJz+vE
         OtqDNlqFMln1q2aEPj8JK7v3oREABP7rVgxKjsTAzc3yic12d/pBlvJim410ZZBp9eZp
         klvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=Rz/fl6vis0olBYvNGjwoflZCzo1DtnIPst2A6/bpprURAbWjv/i3RWmLQ5tRVCAaHV
         6aY530N1qf1MeWIFspD1/52BFKBwMbKQZW9aUC8tek1gpjhZl4bx7VfySnPg6ZenLPuO
         IDkPajnkgGe1YlAq+IMqvCaZipfqvKahSDbiJqMupxTDmtQGTtD6EQato87965n/CBwN
         h1TDU1SvriU46nzafUijF4VFAl1KxPzeEm45GIb87F1wbaJJhzsdrqXWC/NN34eoV1qG
         WHRqyQHsxU/184jNyNlqIxQiJMNpghlrqzhAujX7tnvVvDxwPky2gYWi40Bi01BXYnGh
         OeNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602610; x=1792207410; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
        b=OeYVMy4m6CM0OtvSJ4sV7EqsbY4TElpfZnJ8GcpMGoj/SX1ou6TcK9bNBrGTeQugEy
         dxwWywfualAXeKPtrrDFffBL/ujFdbEgm+E4g1pDmPI2e1yxLwrU8sA05DEvC+l59dtQ
         HZbmHHyutsTsWESaTgjZ8Kbf6mNjh3XDwj2SEuX8aiZab4zTVxfasOO5LTJjaptShpmv
         kCc5ElcXm0363COo9UqRO/JCrNt2V8ldYz5DwezsEcc7KHsJbX7C8ul3jfZPvTt/Vl/5
         CccisDJyj+Mg9JW95moCe1Sg8tr8v1G0VGmG5m31jQqcB4OxNV0MsFX+PukHoqPGcbaS
         P+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602610; x=1792207410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
        b=czzD+Gnsf149sFzD7hCb81U8Xa1QCOmRe6vhb0egQCvNWkvoQ6pc3PnEyC05X54PE0
         N7IFKc4ClPMcWJukZyY9l8PIF4IHRkNTPFnBd563ppvSCV1Xg44K1o7r+j0t1yVOC0hF
         mQbZv6WKexEWj16EDtsBKLw2IZmvp3lvuSlK29BjJCV26j99uvR+qyG8S5GOEWsqJfy8
         MX4ZuzgtUYRN+6m5IYPp/30+wRI86hyVB4SZhhkg3pKXbclVnFYv/PRCvsgbLzZvtCo1
         zAOKzh5h7stZjdV2n+76sGOole+R6xiRqoPCQ95q1hvlVYhC+9iRbqlLBAYeULxA6yqU
         eqpw==
X-Gm-Message-State: AFq9FYLx943kjDpobBO3+pYxlQ9Opq/T3IJUdayKvzUN8woBn4fwLEaM
	6d4wQouwn7thsnkHRb4FulcY4gVO1+Yf4hhWasghfXFIYrcn5ooXQRf9E+aNAJvsuAV2G4bajgo
	B0N/I19EEYuVqgTg/EqBEBJyxtO0Jygg=
X-Gm-Gg: AYBFou0C+9jiqOTOmvG8sqG8l2+wZDuKtdKJg+Y8e2a2srnm7vtXxSserGgqcZJWtWt
	PRcXdH+uCt94rwUW7J7pMIz+Ri2jGPbkNMpCLZli3yC1vZj5NYmvIsgKcCrN4X9azLOr0Ound64
	FCw04IongJc8PNDOz9kpRZQXhpBFfilmxpJTxZpf+EbS0ZgdpLoJFk8xgMU2NkCthpEjDWGzSS5
	K8AOULHcDezr4tant7bImIx/KJZivbucjsazfH8eQrYJ2nzmkwow1UOfJgFE9ifRMwtowuGna8R
	JLFab5CuTRNAFrS5Rp3vs6hXj5jkttU8RVlH4/arDgfkwMCmmviZ80ODUwiMp35DGa3WxR5+i8D
	HXzsCM/f0mMYKepfbXZnuRVbAbSBPg2uutBJGnX+Nb0BlvLsMS3EUqJjDU/g7Kjohxvt3wBzNM+
	J1vH7pjBJmdLEK4yyEEmyVYItWDw==
X-Received: by 2002:a05:6a20:d704:b0:3de:44aa:a0fe with SMTP id
 adf61e73a8af0-3e16bf5d3a7mr3520554637.71.1791602610344; Fri, 09 Oct 2026
 20:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009112634.33436-1-phucduc.bui@gmail.com> <sashiko-outbox-165390@kernel.org>
In-Reply-To: <sashiko-outbox-165390@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 10 Oct 2026 10:23:19 +0700
X-Gm-Features: AclHuK_uKif4wq6OZ-W6ppQilaYG0g5of1u7ef6wcj74Tvuv3OR-Tfopp2PgVYk
Message-ID: <CAABR9nEdvgNo-ENO0BK343bdpXeddw+K79GGEHvZTt383sx8Ug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: High]
> Is ret uninitialized when used here? Looking at mcp23s08_probe_one() in
> drivers/pinctrl/pinctrl-mcp23s08.c, ret is declared at the top of the
> function but does not appear to be assigned a value before this point.
>
> If devm_gpiod_get_optional() fails, will this return a garbage value
> from the stack instead of the actual error code? Would passing
> PTR_ERR(mcp->reset_gpio) to dev_err_probe() instead of ret correctly
> propagate the error?
>


I'll return `PTR_ERR(mcp->reset_gpio)` in v2.

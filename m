Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781498;
	b=0d0s8Z3273OcDx4ciMR6iurFt80hE/k9Vcu4tw04Yv6hvLeS0gelg+JVR2QwErALyvTY
	 EK3Gcqm1mN8Ier1nB4gsipV1MvGQm/LKl70LwhfqocPknTuU/M0K9S3oW916MmX/oji2b
	 c5qjKvGNyplM4BV7qXQ3GCnEQ8vPtIJFb1K8CPko+lJjwFDzYeAZScVcYMkZJhAoLn/Ko
	 VVwdP4qqkt9cmHFSXzLzsZyvN98lCy972uI2r8EJeUKeq0OeeEUBR19mjeE2Hll1Dmk7o
	 1bOHJ1Fc8yG+RRmhrnNnyI7xIFX/mS1alIKJY8HiGJqbm2Kbbc1xCi/1Bj+ljo9AQBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781498;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
	b=BTCuT+IdcwccLYA/3iz1kdQpIGIjXR57n3lIAPdtcqRiK+SQoUzMkwT5+GpxaQs5+a/r
	 9UJz4DaclJg0qvKEGyLoPX6xyiEZod7XpCgYAeprDJpBYqE+bBPTB5AUbwfoE2q2pHpjL
	 X6jDah7cc3AGRF+PfAE9zkuu/ckOe3qmaEbrvSoc/dwb2P1Ejuco6O1JO1ffJxZymaqCs
	 mqbKeIyltlAp8mf9Z9PFC6clCkomhz3a8lh0jPX1oz8HdTsSW3a+cAJdcJ9v8lRGsyBrq
	 u/FVEV4zR524PPhd7KcrrXJkVTNq8EpdXNm/A1hr/V2+Re7Hz3uaK4Y2gV24uLRf9+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AD606A32D
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 08:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so334496a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 00:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781497; x=1794386297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
        b=d3Mw7P4KpEutPowKQB9DumL8hqbSfPcMCJHXfZuroacBxrFuSxNq5uFnIyqvtW2tfm
         YOxRddwSM3BqO0V2uTBTq1SpTFRdW6VD94lmuQQR26IDWcRrhZfvMYIiWf5ANHzB4Y5u
         m6/IwtTgcENJIsxDjC1lA2cOQdD3LP35ODAI31GpLPeSizjMATxQlNvehOV0wY7J/66u
         EPbe+6XPyiV9ZujLucx2pBSywDNHzn3sXeobdBN1IhTdle012vUDDEXACoUrI/dfDjeR
         sBxQg/mlsHEQTp0+aANNEP8iOlzVCaJGwdv+8u7VtimxpZTyavOKAoHaj5VhLOx/Osfq
         aJPg==
X-Forwarded-Encrypted: i=1; AKwUvBxoAzN9O1w4Xf7weBSvog8g50PIZU6xwpqVlxyrl58zkVtlwViGl3ibqMPqgRcKosBLTsOn+Qj+S8hC@vger.kernel.org
X-Gm-Message-State: APuU4Z8+NETKERAyZSnwUsFewvjDbqDBcuSA+VfqiVOlCgVaQW/SLYmU
	Vs0oYD3frYiDCpdHvtNzDesBmJuwBEOiF9lpqkXW3DS1Ev5dZTAkJL74jC6msbA8
X-Gm-Gg: AYBFou0YCrS6QWEK4i74l0RZSmTPR6aQivmqZmUECVPUzhotnDd7hTxlaEyyLNtLBT4
	tBBwDHvwPaE9b+c+wZDfE5mwUh/mVf50jqOMiZ9h9PE3k6MgR8nCFVefQRH1KwayS3OQbz9jbUy
	mg2Bu+3CXbRDm8n7hZn5knBBE7AND6xE4pbQSuXHWlVuWSwrYYW6LSs60L7qviVHuXw2JxQHOe3
	ttUnCwW+rsjAARWvAuHRal5irwjpzjt8dlQjXHNrHy+lMQ3TwbRFVb3j87jQcpvsfjnh1dY6SsD
	79IWzDDfa/+ieyWg6E6L6f9aj7ruHFlPwC0BocTZ2co4Qi1xYlcD6eJlSP04yJ1OcbLdBiZk1o8
	hKPbPWsZc6u7poUJqnpab1HWHRbCj0FTtBsfW6/EJ1CxOBg4EDXNjglfyHxd3EX4xH12n3nkpAc
	SR0vgSN3JDedufehosyudDFLJD6oOxHrhNcox95wByUbF7Pk08MlboandQCR0H1ILeuAh3dridN
	kl9nHl02SLKZECNJj1CkGeww4VHnoum69aZAZqGpBpApC7QLSqnGK0uSDit0CQHM8ocs1jy1z1O
	cxDm451pkILm0UTReV9atJ5B3kf0oWAjlDRXVwIQajAdA8l/2u1fBJ650dnBKsfbnzntmQqdtuK
	ScWQDcQ5HjmKgi5FgcRpngI89o+iPi7P1+PlYIZuKmyk=
X-Received: by 2002:a17:90a:cf04:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3ae897eb36cmr9813211a91.19.1793781497530;
        Wed, 04 Nov 2026 00:38:17 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09451c650sm1499047a91.0.2026.11.04.00.38.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:38:16 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36d6765756fso17466eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 00:38:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy4ijNE8lzVZx2v3QBE1apBZ2kLFi1Bywt2hzzUoUTArdH1+nrNOUj/UI8lBxAuEsjdNW9b6RAcOYW/@vger.kernel.org
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id
 5a478bee46e88-36a423c6223mr23977690eec.14.1793781495997; Wed, 04 Nov 2026
 00:38:15 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
In-Reply-To: <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:38:04 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
X-Gm-Features: AclHuK9iITvqHHty7IqgPcA0y5Bp8oR0AxaQXRkiXUsTXH1SHKpldLZV4qph5bo
Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Same comment as for the DT binding patch.

Will do.

> More common pattern is to retrieve the address of priv with
> gpiochip_get_data(). You already pass that address to
> devm_gpiochip_add_data().

Thanks for the review. v2 will use gpiochip_get_data(), drop both else
branches and add the blank line after the header comment.

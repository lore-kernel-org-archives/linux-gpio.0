Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505533;
	b=PmjzpejDjaaGVnCXgCKfmmkZX/ntF+82ZYEocAOw3XyapebGgcRIzU7idVyppvE+MCoy
	 XS+3VwmLzq5AUXnJIJaX5Ppz3XwHHd34Wq5XcYHptq1xQ7PiZPBCoGsr2CU61UZ2XaF3h
	 zC8qqPf38L7w+/+YmmMLjcNrTezymxXIrv1BSfirJxURD5yK49JB2VuiQjeBklc23JO6M
	 cDVPukdjGAx5pZXXPzE2d1PmWJKla2OcD9elfrnYgflE7nGpeZQ9Lk+PMDAK3ScbXCeNA
	 /0Tdl9T5JDWpMH81orRm3e6qGSseg72g1LhJmhkG/uE0eWW9KrWQjlrLSxk5yNozwCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505533;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=3QPH7tP3KiG6F8PI84uSlU7fqi0gvmo9YCmK+PcQ/Ko=;
	b=4kUWZrdLoHl8gKsyrTZw9JxoAOkiI2iOPAkkOoCWGkfAyhbBb6A4qa/o6LbZmfAn1COn
	 tuPlylgO7bQYJcpriiso9XtxzDUGss+3P3w58UIVesGJ01WB2PeRPpzxQAMtIBVsJldyO
	 ARx7l5FkA1fVaGs96/8rabnmRJpYrGeXK5o/9CAGBMz1LK2CmwiNL6WMvU3vokk6HnHg6
	 l6Sglo9FD1sTBJjFswKUXg2NY+m06Vc5iEn4DHVMufiqOErFWUClLBO+gF6ddtYFocWyL
	 Tjnu2wJzhcHZZ29ST5y6h5KLd8lgKHRqLGgPFpeWVgYzaX1TQ+SpANT+CNTEBZLNMvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LWxLT9o4;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9394606D482;
	Tue, 20 Oct 2026 14:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9394606D482
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LWxLT9o4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 42A254E41289;
	Tue, 20 Oct 2026 14:12:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AA7B60393;
	Tue, 20 Oct 2026 14:12:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C764E10328DD0;
	Tue, 20 Oct 2026 16:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792505524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3QPH7tP3KiG6F8PI84uSlU7fqi0gvmo9YCmK+PcQ/Ko=;
	b=LWxLT9o4UdOTVO0xFJ01Dexr4y2VWGevobBa2gpy++e5YMTZ/ms5G8K6BSa8t+WFwXX06r
	V0DWOJCXT3aDKPTK3b0NsQdDLZu75AqjTIcgAdEFaTesl/38jP75gQRzdJFV7wxLXw4T+6
	hP8mSBhBz3CSLlCrm4HZRoH2yimpZk8aFvi6cIXpUEhFZpHH9W9QrmsvhETmsFKVcNhebG
	TQRZ0LjqFQuOHwUiD9gOYeLT8Soldxm7ybFqlz2uJPOYG8PwrIKbWsjfeTacB8wCpqUbeJ
	8zjFc8Q75hreNbPu1lR3snGOsoeirQ0Sf90nqfciPVwvtI9+qcpZL7b0t7KWWQ==
Date: Tue, 20 Oct 2026 16:11:53 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li
 <Frank.li@oss.nxp.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Leonardo Costa <leonardo.costa@toradex.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke
 <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 6/8] of: unittest: Test fw_devlink with PWM nexus
 maps
Message-ID: <20261020161153.19eb32a7@bootlin.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-6-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
	<20261020-fw-devlink-nexus-ready-v3-6-fd6f1c17e16d@toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ernest,

On Tue, 20 Oct 2026 15:00:17 +0200
Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:

> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> Extend the fw_devlink OF unit tests with PWM references routed through a
> nexus map. Verify that the mapped consumer has exactly one link to the
> final PWM provider rather than to the nexus.
> 
> Also cover a direct PWM reference to ensure that it continues to resolve
> to the original provider when no map is present.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> v3: Route pwm-map entries to two providers, use a middle entry (Herve)
> v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com
> ---
>  drivers/of/unittest-data/tests-phandle.dtsi | 22 ++++++++++++++++++++++
>  drivers/of/unittest.c                       |  2 ++
>  2 files changed, 24 insertions(+)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

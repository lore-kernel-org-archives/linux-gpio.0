Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823459;
	b=bokBY5yavoCLXb6r44Z6DoTvTiuA/cCAdghAj7g92q6KBWN92TzivgAxGnhj0JIlQuny
	 kXoR/RLwLdvhsti0xEIZIfUdr2UsVA7x22FPkFgTe1DBjKAxXAkpHog/tDySuF/L7KSCG
	 wM0guVCi0qwk2Cug5zaloBfZDi40QpwQUyFUKhRtMtGWRMbpgXR515kFrPAE/4xv+DgDe
	 ceYa8ph88HM8KkoxYksEfNSVdEZd/4XoFo+9ZBrH6jc6iX9VFRdaNFJVkqENER+vNjgRk
	 RXmmlxvlugDCXRjgQmrk78Kd9HWRQrpm1abO/4fvmMqFncFGcTIhHJ12S2vxZRZg9rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823459;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=0hfRGVDl+PzAZjsqP15lmfu4lbYtTRutweEiLzOonds=;
	b=412fIWVIcsNXGHBCG8piqORrSRR/+QKfs+wXLhxpyv2obxh6qFxc8Ya0RBtRmCynoF1w
	 aIXcEBlSHUfwnwlkkLWpoTnD2qcjkcKXD0GsDgeJxRWTGROSmjaWPmkCeZjei1yl4Yf0c
	 vkA2oDnGzKc8cWnqvMknALAw1qKdJ4h1Sv8iMapdDl5L6qaNr6L4pXvaLtgDuu0eCc6pF
	 KxTlx7UWXS4kCfH36n2XTdiS9jS+DBWJm/DUaHaZ+UH8qrjmfG2OP0MO1QxGM76ZJmTZO
	 wUlKUwcV1HCRDRfud5PtAFzeGm06uWA/eb1xwPF+zr92yE2wvVpYMLTrjSt7EgLPL/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qw9nCYWO;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C164606A323
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 10:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C164606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qw9nCYWO
DKIM2-Signature:  i=1; m=1; t=1794823450;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
 d=web.de;
 s=s29768273:rsa-sha256:ZJlapb0PrvanuZ2jl/rh7aRGB+fK
   RnJgyfsgm36O3X7IEaPwlov6u9BTFhm31A07O0M8vsozwln7dUSJoHjI0VMqzw6g0uzI5Kt+Aqk
   eIJCCAKU1qjtLj1+THlW461hkahaVstgameBLYeOzz+RmEtp/eT+e6RB2HiRAHXyMUmA8z2tzoF
   a7mO+fZbXWXSJ1J/JwKejHgCSDPwrb6AxIXIBdXalGjsQfKkjk6Jm3oILFqe1zWhUjtlh0Rvr58
   v9aOH0f+ED+nyCDjr0wDugR4izBLtSCXgC/l81E+I5rpksitO2DgDG5w8vDcfwOue5JuVKj45gV
   ue/CTTgKUr7D8g==;
Message-Instance:  m=1;
 h=sha256:
   MQq03cFCOaHqHWHqMa+tVB8Epfo6fUXsjBuA53CvzhY=:
   0hfRGVDl+PzAZjsqP15lmfu4lbYtTRutweEiLzOonds=,
  sha512:
   xJzbg5ReXmHLxXNShqewDk5t9L0Qcu7gAdjhe2gvjeijh3AaB6p/2AUPjgIZuTl3nQZ/KYKeP/djg3n48KdtZw==:
   mgHpMYo1aafIA3XS68jGXjS4q8yIhseyApK9H9Mmlyrx61urxjKAAwFbTM0qpOTVLYhIb2nw1GbNrzo02ir/dA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794823450; x=1795428250; i=markus.elfring@web.de;
	bh=0hfRGVDl+PzAZjsqP15lmfu4lbYtTRutweEiLzOonds=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qw9nCYWO7kyy7IWh3M8sSYVp1t33TUh1H7PtgUs0y4fpua8rxkXJIyk9V1tQCAA8
	 HyzjW8SieXKq0Co5vp4fPvfM2kycR8LK9KVyJgIjRNFV8wvChQE3lCgr+O7R/qT58
	 4CyU4Yg5fOLd4HEXRC8jG8hB5TaIZW4OeFVmH/9YUhmBc48wzgMvk0tFoaC7rYXZ+
	 q5/dbx6TXBQnHPsFEr4Yve4vB7aw1GEDlyrdEP61lf8KbZPTb+vAzRVdKkwj/OOxY
	 qTwEMyMYRV4eRcd1u6m592nW2xyaWdMQmtYDy0Ah0QA/kjE3uURBcXKuIlhKkpu3U
	 aNGWiWOqTFkPedND9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzTPW-1wXTac1CAy-00vrM0; Mon, 16
 Nov 2026 11:04:10 +0100
Message-ID: <37a1c30c-1504-4d2c-a794-92c2972830d9@web.de>
Date: Mon, 16 Nov 2026 11:03:54 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>,
 YD Tseng <Yd_Tseng@asmedia.com.tw>, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jesse Chang <Jesse1_Chang@asmedia.com.tw>,
 Richard Hsu <Richard_Hsu@asmedia.com.tw>
References: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U2b6MpGSM9yJTjhDpGj98/nRECZViQWEr3s288H5XGF3CVqoxWg
 6anBgn8Bvr1SyCrdnogNUAGwmKZkrYErPZ87jwaYGPtSF3LBTv9p76Zcd5v75tAADFHhptC
 NnIUaFXbg/VvcnZG3OxYqtJGfSZUPrX+khkClnzE24N32iVaNRbfeShIPgO/6H6cotKojn+
 5vkW7+oPRjc4gavwhgpyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wO89ISvSkWA=;plNvtaYZ1sjmZqkaEvrfhxQHFCT
 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
 drxomWMOiDtYTAQCPmZ44jhFrOg==

=E2=80=A6
> +++ b/drivers/gpio/gpio-amdptpci.c
> @@ -0,0 +1,634 @@
=E2=80=A6
> +module_pci_driver(pt27_gpio_pci_driver);
> +
> +MODULE_DESCRIPTION("AMD Promontory PCI GPIO Driver");
=E2=80=A6

Would another macro call =E2=80=9CMODULE_AUTHOR=E2=80=9D become helpful he=
re?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/module.h#L2=
33-L236

Regards,
Markus

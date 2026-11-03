Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710792;
	b=W53R1eWqh9WAl1HQk+cZOBPuQeFqiFCJ8rSvSp4R3I0JHGoxUvknDkJntJGaEUeiG4Qq
	 BZ9C3EMlflRRpJeI1SdtM+nHLqJtCZ7qmPjNcxeP0JUrJPDjXVEgDGPBYvnkdIiU2sHN1
	 hAs/SMdOyz6sV9oNjH4jsggFTnr0iHbgQz+tSpt3RZ2qm+L+YrYgY/XwpBYoP3Oh+8H1G
	 PDaPRWSwy2iYCZlhDuK7A2J5zwPhVIXgcsyIGsjDdzfiV4lTVR9s/NI9Zff9YQ68eeymp
	 M/rRmq4OLjPBICbKS2bOyHDL/c/fCxeqL8YvFj7Eny9ypc7uGCl9AfIVMTlOwE/V/6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
	b=y2flC8Zryt/mWTUzT9A9OV5/haU7iSueVFlkSCDYhTXM+MWD54t3NRdQMjW06ZI4Rmbc
	 js8YKQ9otGanfzu2tGDAOszu98mihPiNuDXkmH6Z+SvXm/IrmNMYbTDv4HWMvgdO2lRq7
	 T2izEaqWwJiFz93lnKmxE6+IkDG5uUxPbA2++hbTq/W2HQzkzX0Bf+ogNOxQ+03X++oYH
	 4VtFfcTCR7eSfz1VrqwV22FnTfnVpKEXVPpbk50LYI32nG/7/5pwRbJrZImFNN33brwQG
	 EY94JsCZWb/9vHKdWhalteAyBZ38lbt2+RMDyumPishjj9+KT9V8Tz2/N0h4VobuV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNQ86Ghs;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9B7606A328
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 12:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9B7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNQ86Ghs
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679334baa1fso4435264d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710790; x=1794315590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=lNQ86GhshBJaI+ue0tJpUXRW+nxMg5T6+SuJWceb7EdYMYmexzQON2X0hDizsNNjQj
         HaJKuZVMsMFRZ3rHMQ8gvUNNGC8M23Adoz3UBRl5KNFnKQm/OmD2RJNvSbwy4aJucVjK
         w9oOThxPsOpLqDOdilOJWYQvTr2XQrXxrbA6G6TViu2NB9eqdGLY9MY+PwImL/TFa2XL
         VXgxqq05oM2R0LTVnoW6dxhFj4fiC9dKL/ZYUNwEHAU+G3cBzVhyohbfJ6xQtekJKLuh
         uCVSyhpQrONcF58PKptppwCwZUDWfykZ27d+WfE8lebavEeWPa+DsV6VTGhDjR0DrSaI
         LN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710790; x=1794315590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=AHfmeJ58DlQMOYsUxKJSiwNaOgxwkadIQQpXtAKsrFXV+H500UTV3pi9LLNzUwOePP
         sppTtnOnYkq1GiL7J5PTEGGmPNuGcOO1lB9qOcmTyBIx6dq0/vgVyrrpjMXBC+9MnVZ/
         sRonPEibqZOtDbEMDkLzMKKRls2Ll0T30ooCiceGRHOv1b6fwkpLddobOZiIFDXvtrBz
         dyTWrh/5pmYpevFttYf7py5fp52HxxjYDBirltUVI/1cb3se7P1Fdf1T0mrVmjK1lu2T
         xlFyPRW0r8wbhtab0Rww123l9U536Kyrsq/cfWF0qxMCoPkfQV7B4rrSkvhLLdjSodUN
         x3Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwyV1gBwMhoHHlbm7IfO5tkKekpgrn0mHhvpa6/DFYCNqp0ZJLD7xPMIduP3Ytl2xJLsl7HiRAwoS/1@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZrUp4a6fpl68hO7Njy204WgSCavspprGBQxAk84WZNaHmDnNI
	/ET+apvOTKT+maM9ouCa//NkiIYfMV8+pJ/PDR88SNtbIbUZUelNhqHA
X-Gm-Gg: AYBFou0UAQAaUvXWObub5977jXOPcUE63R/UIkuMNNrtf6NIJ0b3X3QgrqQmTPtgWAg
	Eae6HHFBXT6OweNUzJZmzKaqQHExBeu3N4TpsNaMw8BDVOIQGwlbiMwzge67xc93mK4ymBPXnuH
	sPFjQR8gWRTBfIlra8gZi5SE3JY/Frw6lGe/boTI5OTVgvSXeI4ZfomUtps2ggkZ52Nk+Fwkjrm
	j6DHyRZHBrUO1hb9wn/a18LpH65pb5ChA8bFgflBTMrQecWqrvroGmQZ1Nhti7UNwSIP09CwjfN
	r51+rj12jfdEeykE/xAEwjZCqe+pO3qA7cw1EtCyWJwcaF/u2GEoP2hSgGgU37w6+7NCYX9fves
	M6OtNbRGMH3hRZV9BpVIhyfS2IGjZb6GSlKZi/ZHCNFjIeFLitBqZj2Lh6hAfEI1GAfr3KMJ2c5
	QBrJOyFbEXrTiKa6CMtbNVQZiOC2TnvMzYezR4bIyLOJjvp9kdYReJdUOLlpfeLxw20rR8HTHRo
	ZtWvttdIURGpY/dNq0xBse6j56xniM6kBfp5QAdSj+FZvuLEGqKH7QxNibQX0X55pAggQTjEHeQ
	rvJx5z2koXlqaaGOC2YRW9y4qnK6xL9dBZtE7AdUEYLxtk1aRLYsxHCgT2fkqZFWNd7/OFlGrpi
	ZSUVTDrhoF6l4urbEVtXjQ3tXuuhkRb7VkF1P
X-Received: by 2002:a05:690e:d8a:b0:679:9b4c:5b95 with SMTP id 956f58d0204a3-67ba5049d99mr6926082d50.97.1793710790484;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b6d3ba5bsm70882847b3.0.2026.11.03.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:59:49 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Tue,  3 Nov 2026 09:59:36 -0300
Message-ID: <20261103125936.156701-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
References: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
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

Hi Enzo,

I tested your patch on a Radxa Cubie A7Z (A733, 1 GiB LPDDR4), running
Linux 7.3-rc6 with our local A733 patch stack and SPL/TF-A/U-Boot,
without the vendor boot0. It's not your exact base, and a733.c applied
with a context adjustment (same change).

On 10/30/26 22:26, Enzo Adriano wrote:
> This preserves firmware voltage modes when explicit bank supplies are
> requested.

Three warm boots with your patch and one with our local A733 pinctrl
patches as control. In all four the main PIO and R-PIO voltage mode
registers were the same from U-Boot through Linux, also after the
unused regulator cleanup. SD card reads and USB1 Wi-Fi (with R-PIO
GPIOs) worked, and the R-I2C0 bus is there. The control produced the
same results, so this validates no regression on my setup rather than
demonstrating a before/after fix.

One detail: our DT had no vcc-pl-supply and vcc-pm-supply, so the dummy
regulator reports 0 V and the R-PIO path isn't exercised at all. I
added both (3.3 V) to the DT in memory for the test. PF already had its
supply.

I did not test cold boot, 1.8 V switching or A523.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z

Thanks,
Vinicius

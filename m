Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA02836BE;
	Wed, 11 Mar 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245503; cv=none; b=bfWs0iqUvvzJilOrCEOMV/2ob4W9L74l1rYbmkyE2s59UWaG595PY0wuIG0hL1yJ9noDMYzNCRieRxumTWqxLcjHRKE/VxHjK0xte6eoGrywm+HFCKhyl7O1EwH0iatACEmb0UXFoadyaaJHtijPLTz2JSYy2yL3b9J/9Lfzsi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245503; c=relaxed/simple;
	bh=evV2rhrIzHx6r4Vr4HBP0eaZLjm3eQdiuatu/5CQVUY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hh1fHrHBNedv7Le501HlBz7NozAXsCyX5CC+IVcdSDWrtCZ9+CIcTJeXS8+TGm+sbiCDVbV4PCjg6jY8nvG7Ug5TPLc6rbBf1Pw2DRUh8QM3aa1Qth3NSceeeuzcalBKq2ESRgc6kaSTYCmFzdAhjE5KEygKkQeklH0rb2tLRio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZJZW7xpW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZJZW7xpW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 980B94E4261D;
	Wed, 11 Mar 2026 16:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C1B260004;
	Wed, 11 Mar 2026 16:11:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72C84103691F8;
	Wed, 11 Mar 2026 17:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773245499; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h4UXzCKBp/AtRlL9HwQ21GZlqc5cwCvVv8lhtud2N4c=;
	b=ZJZW7xpWv7UWurgWYUo9/EK3dvUe54bVyyWqTUG4Qe9nSxyBccLHHEBqkzoFADwePBMNrb
	pVu77BHK1ZbermPxkrhmUJIurCC4i8oZs2/gyCNrsTt46EwGau1YlyAcPgD+0o84BpjRsw
	C+oiOP1TyNdHsez0ca9+rGG7LlNPXVU74EuWW+LAzJ1BjltcslbTi3AfOoeDCQz0hCBrmm
	RjWSlkLkJN3XZc1owWqHy7xaN0yrOcjZpoOpX+nk/eT0zcmY0KcfK09bkW1617VAA4nySL
	xJfvIaqKSyAnCjbUUSCBxgXsM8WeecG613XHwdutmMs0zmDghF7V5GacOrpG7g==
Date: Wed, 11 Mar 2026 17:11:29 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Daire McNamara
 <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux
 driver
Message-ID: <20260311171129.2c382b91@bootlin.com>
In-Reply-To: <20260311-vigorous-steadfast-04afdcc9e524@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
	<20260311-vigorous-steadfast-04afdcc9e524@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Conor,

On Wed, 11 Mar 2026 15:17:40 +0000
Conor Dooley <conor@kernel.org> wrote:

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> 
> Add a driver so that Linux can set the mux based on the interrupt
> mapping in the devicetree.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS                         |   2 +-
>  drivers/soc/microchip/Kconfig       |  11 ++
>  drivers/soc/microchip/Makefile      |   1 +
>  drivers/soc/microchip/mpfs-irqmux.c | 181 ++++++++++++++++++++++++++++
>  4 files changed, 194 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/microchip/mpfs-irqmux.c
> 

Looks good.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé


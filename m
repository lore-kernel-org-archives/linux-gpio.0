Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506476;
	b=RhwJy/SpqEUMIEhwm0Jk5Ob/kPFHS+xLBkQeNgb+FERnC0ftzSwVCMhN1ZndMbblp9qt
	 +SH5F7dqBZ3ForXORlzIBcPW9uyMI/FfDMwT0NUxarW55HvE7LmzEvFyCkeJSB3Zg78hy
	 JGWFEadqlmWzxCb8O+b4dVs+OnyBusA60XJhe6W11aoK3Wa0hK27JTw0ENbecxnFysxz9
	 TBDnmx2KIta4SKPqdL93WKUUNe4sv3efIfUHLpumXzMFEkJtoGjP+XC44ZTYKSactCAbB
	 jM33/xwZBP/Xr0QWosFkSTCw8knPNwi6zOonqRwGPqMx95Hc76skpj4GrjYekytv5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506476;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=kmBy1fe6LI5oXiYPbhW6SzvVcy1Ogh5pT6iC7mSTUOM=;
	b=AKOuKvxCDlYPke4ASbT65XnE1yfdlOIC+oV4UKMLe77B0m2iFDeQ0a5JTCJJh/QDJQ5f
	 19mfiDYV8CVcWrMRRWFCBzRNfFlwu1oQPAv0OAdVhGDf9yxeL/UnRaCPKeubGO6UjPGDN
	 kIRmJpnuHhUvb7rS9M35DesXDWFel1aBZxGKMEnV4Bn+mTY/3i+iQdEkW7uBbhymA1wbb
	 SGgG1oGO9Vp++KYYy7MYBzoH+TSH/fdV8BDsRsZThMeaycM1nVCs7WMuyOmT8cEPDooiN
	 6MIarF2x0GVvJZwrDfquH3mRY3fHnEjmPvDPV7kOz1QSWIML/cVaBqlH7lpSTq5FNow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NfM2biC7;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936A606A329;
	Tue, 20 Oct 2026 14:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9936A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NfM2biC7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23DC3C63455;
	Tue, 20 Oct 2026 14:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F49060393;
	Tue, 20 Oct 2026 14:27:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 189CA10328DF3;
	Tue, 20 Oct 2026 16:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792506466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kmBy1fe6LI5oXiYPbhW6SzvVcy1Ogh5pT6iC7mSTUOM=;
	b=NfM2biC74Dx/3Yhz14WigU8d8Se1zC9x3KPteernMS0aBrwpHL8t3yKKgjtiBK85V7smNT
	0Sr9jRAbaL9fqQ/uQ/rMQcXSrOYyw1yQM7p+fOcPTul8INOTsWuurKS36mhDKE8jc5iPIM
	QYBr8EgEqLufOp1LinZOCiCxEAjrJUvDAwwFQ+8AMbVTR4kMRDr13CojOEnUaf4Go0VuhC
	MBW7l3V8+w38SkAw4YMpqfSk8993bPpdLGHcnIoAVjLdhgrowvPxBN7or8GBqDiNXDBn12
	LVSUfGRDPbpNeEeTJENkz4ZJ+UMkjSKpfa23KxeYxR6nO66mEK6EhphnczYZNQ==
Date: Tue, 20 Oct 2026 16:27:36 +0200
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
Subject: Re: [PATCH v3 8/8] of: unittest: Test fw_devlink with clock nexus
 maps
Message-ID: <20261020162736.422fb5b8@bootlin.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-8-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
	<20261020-fw-devlink-nexus-ready-v3-8-fd6f1c17e16d@toradex.com>
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

On Tue, 20 Oct 2026 15:00:19 +0200
Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:

> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> Extend the fw_devlink OF unit tests with clock references routed through
> a nexus map. Verify that the mapped consumer has exactly one link to the
> final clock provider rather than to the nexus.
> 
> Also cover a direct clock reference to ensure that it continues to
> resolve to the original provider when no map is present.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> v3: Route clock-map entries to two providers, use a middle entry (Herve)
>     No clock-map-mask: only clock-map applies to clocks (aacc54c67869)
> v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com
> ---
>  drivers/of/unittest-data/tests-phandle.dtsi | 20 ++++++++++++++++++++
>  drivers/of/unittest.c                       |  2 ++
>  2 files changed, 22 insertions(+)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

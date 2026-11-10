Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308711;
	b=hPb3zgTQK7YC3h2ym4wMbP+OchZ2ds5WrfkRryiieDlxv6+GjE6oPBxAtZbAQngOhdu1
	 l6kMsk0hyuupPjHIFWGkXE0eQ6lWusNgm8GaiX7ASAJ2GyIXWEnlnb2DE/a8+4MmC2dOj
	 uulxv0+8dsGgwiTrlzaQI/yNcTOjhW1SL9mkBTrArkRAouZHJDcpgP9EGG+CfKQjOVTFW
	 teZ9U+/pbgZMQ+KSHp3grZulJ+Udr1EsAvTus/1tZORzzoTrwYpoNTBwtR61Feo9AKKui
	 ohe6hl+CeBUI147oYZKLGeoyFkohr8Fg8bmFH1anzFZpbxXssLoYpEQbnN8iRJnvUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308711;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=IuHa3jls9LRkHwvOun3A0QaThqvu39Ev4s8CcaAo1EE=;
	b=qv241/A/xL+ceo7t/krZ0VTweVtbZPrG1v1pFfcEEn8XFMxxVgAUoqfLY34nGOBZ5Hen
	 YuoBmrCVrsNcJizemcbxtXL7K3mxlOSEU72lEa2RmZa5/6Y0b9L9qb9ZBQlqZwn8CB/Dk
	 0xoG9AyS+gSP4nPf7ogSdGOrHBHhp/g42wC40M/Pq94zsn+Do0fpFiU+/Em/mtByW2+5L
	 9B2AZNUiGbGnjlYFHLnUFp2zMQKoWeO07l6HWv5CJGE94ruhhKH71BUXBr8Wdumf4D+EJ
	 /fDAoDDCfefyXjvBzHJxzmnCNisx5p12r0EN+gBrPaCF3y802KZhrHZjZQodu1UOnhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="jYJd5Wq/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36941606A321;
	Tue, 10 Nov 2026 11:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36941606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jYJd5Wq/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4AC1E7D;
	Tue, 10 Nov 2026 03:05:07 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D95E73F882;
	Tue, 10 Nov 2026 03:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794308710; bh=TfORLbInG/5mS5oAL+o44mwrKV8SP9yUjQAQHbgEGcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYJd5Wq/d8vt/JF/iGiDk9aBhLRAshODa/k92KYzr/PDNzKZhpDoydUs805bLtpvb
	 Wz8g6109rdDOA1z6v9CJgjz9JlLYHt8OFKOoKVj9NDvPCLGwVHHe3Np7pLSX56em4h
	 xXPLByy1b4qei2g2SoCm65eRCdyP2MQx1HmOf9Bo=
Date: Tue, 10 Nov 2026 11:05:06 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] pinctrl: scmi: send the settings without argument
 as enabled
Message-ID: <avL6YteZHaQJc3D_@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:34PM +0100, Clément Le Goffic wrote:
> bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
> drive-open-source and drive-push-pull take no argument in Linux, so
> they were sent with the value 0, which the protocol reads as disabled.
> Send 1.
> 
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

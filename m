Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308519;
	b=e3jYgIBwa66UTAlE5gIBZ+sUM9ellRJ/ywAqD9ZVgXWUgM6PUxuDj1o1gHplpXgTvFSQ
	 sL/0/r47r6Gchgf0ZCOWbTV1Czrswn3M0hxLyXR3YifUAoFv0LxXODHW3vdAzPHpq3t7p
	 Z6sPjRcPSTSkPMsPz+zzmr0ti+gDkl5lB+FOFig/yLeq1IBnQVSfT3WW5ItKafqlRS82E
	 A0dRM9/HzptMyKoarQTilA3vuHuf4FK6OzcVbL7719o4fEc61q9OJxCRq0HlUJAqWh/ZF
	 1bYY+1v0H989solTBYDydj7Xt7auCXQ8mW6qjgDq0ANZMVTNKRFNqUCLk0UMnItRQRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308519;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=eSLFMl2R3lB8+9pIKfTRq+QhKw80CpshDdlYvBLLhiE=;
	b=BnF3qLEgMmoWIbjBSNHAa/vvsWDB9iLHMDUe2B0kiywLD0JYMK/ob/QAamUSId9W4htT
	 UtMaavlDPHyJLT0c53iS675xyVdLCcpAW4VjI4rO0wv1DKVs+TyjIyAeizgi09d02Ddit
	 kXPsFYvnB3j2jzbOF7VOzBqvMg+Hj0xiCs1+I3EfF7iW+8b09pP3zFIM9+sZzw1ST2D6H
	 /UaPkRKsGyPNaSs6wP4UALUDLlmINJsuUzfPja/oRlkNlUUTkSBSwUVSB5C99dqqaQCex
	 +RV5CZLlM26OvFElknYfDYkyB2jpRriWWHv4zR8ilCPkjc4sb3R9x2MJMMk++5piQQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FKqPN9Vg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82C2606A33A;
	Tue, 10 Nov 2026 11:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82C2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FKqPN9Vg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347101BC0;
	Tue, 10 Nov 2026 03:01:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 407D63F85F;
	Tue, 10 Nov 2026 03:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794308517; bh=QlNntSieLC8S0YvRLd6Wfbbt18c4nXb06umZDP6TNas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKqPN9Vg0UBCyIbmOsaTZulIJOB3aI1y35vAsOHgGOHwrXPB5Vb0mWHldy5uSiAea
	 /rtVJRwnHK11B55hGPiy1hFaXYryF7/WHJ3KdNjJ/InOVLq88ffwfxbSGvPA0y161y
	 pTwsUdcVncKo2fkyz2aj3wWvKP/SCFMfM5TxsMuU=
Date: Tue, 10 Nov 2026 11:01:52 +0000
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
Subject: Re: [PATCH 01/11] pinctrl: scmi: send the drive strength in
 microamperes
Message-ID: <avL5oKJtdiKrzLlg@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
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
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:32PM +0100, Clément Le Goffic wrote:
> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
> 
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

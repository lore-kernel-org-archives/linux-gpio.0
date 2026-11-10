Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311342;
	b=BtWWdlj1uf5wSMrrQ1IeYTnhDIdxaB/Pu+pTFa1ARzEDT3KJ5K68ffisHWCThMdD4WDJ
	 LsXstWJNG9idJvq8Mqq7MiThf4WmvGqaEspJXDvQidQSxF/wmVkTI8+6iEbKIo9tq3ULm
	 VKTDtqZh1vAcmJhxDFhJWhe0hNIwM2mns4b9SxISBIiWBGTvjydlgLpZKlesxD40vuls0
	 QbKo4zwZt++YBgCbnOQSr8ZH+HoyGfSBS//mvxNWnW6QEXE3AxIs9/TVSK75vReOCWtE5
	 YDNtTcQN4k6rA427XnkfQ4/muB7fxAw5oqDWh9NrrzXHxp9r27pLiSQc2lFjh4qD5UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311342;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=XH2Psc0/RA0xHqjw/BmgXYna8gK5TSDyk/31rRsHXag=;
	b=MkVjR93qmZDEgJU3iMDP3zGLgkYY/8GO8mlDJtkVd0UhWZUHpxldNNzXpUvBZ5WplirX
	 waw/kVike/LOIQ3C7YccpMR/O8p9YSbxHEK9CyuLJiOrbiDEOKi3S0mEijNDvNlbZQmsI
	 mI3JtZitZlmxlJGT2poh5jF47A8XHZwOJYJe2s1nGBy69ngpdYRgK/zybVrRkeaZPTtoz
	 WYVkJL/ewIS68w0PS4GGVbSpW85tO2G5XjEQGbuTRRzG3WGGucoHWmHR0hh/l0ZvV1Z32
	 3SN1y23w+XJr20P2vLmMlwrrSOI7Ucxr0qVGg2guhT7tp9IHZ/moUnbt+TMws+ol88g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gtRdmI93;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927A4606A31C;
	Tue, 10 Nov 2026 11:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gtRdmI93
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43941516;
	Tue, 10 Nov 2026 03:48:57 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E4FA3F882;
	Tue, 10 Nov 2026 03:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794311340; bh=AZ4NvMO0DhplbnLnvBGhZhX6wT0BZLera84rlUdLLTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtRdmI9385we0i76Dbqp4XWv8SMqquN/p5CTy/nrl+UVL5dQjy0QcsbbaPgdmcBs1
	 okrD76nZEA1xiq7c8fwInfEiM3WNuSjFAyjld2FL0HS0S/ks0t/7+q8mWNpKe51v/F
	 VOfXa5RtXMULAo0NF4OlIGd1wP3Zm3+A0UC1X26A=
Date: Tue, 10 Nov 2026 11:48:56 +0000
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
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
Message-ID: <avMEqP_O5-R7m3-z@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
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
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:38PM +0100, Clément Le Goffic wrote:
> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
> driver registered them as groups. Register pin-only functions without
> groups.
> 
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian


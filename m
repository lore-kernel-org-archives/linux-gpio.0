Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64C647A860;
	Thu, 13 Aug 2026 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626667; cv=none; b=sD+NpDonaiyjuyaP7RCmwfYBr8WndJGuKug+uzmO5heRLDQ2UovxGpx6fcO2kv8cGiY2a1gAHglJ7um8gnJBRzVNOj+FApLq3rIxu3QBnJXZybQpiCdwka04ha9WSv9Zl1hBy0vgFe1vSLO4Fg78XviQE04afh7hAQdQqalac+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626667; c=relaxed/simple;
	bh=EYWIVQU/40Gs3k950IscApNlj8XNjpbJmIsWk20srgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2B+5GBYZnrngcNX7Hzt759DnQ5DnMkN9eHgVsPmHjoQ+7ffxpKDx180ZIfkh3S++dEVl56AJAUVcaNz/ULUgbaY+3eBurVxsRIPFeftL4jIamD0Ydtd5H9qQptrKoYgcDt5ugzKJGPgssu8zXwYmfmwDNlzL+5UAJw8e2iAOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37871F000E9;
	Thu, 13 Aug 2026 13:11:02 +0000 (UTC)
Message-ID: <57903e0d-3c24-4f37-a208-27501513c5b1@tuxon.dev>
Date: Thu, 13 Aug 2026 16:11:01 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>,
 geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Gentle ping.

Thank you,
Claudiu

On 7/10/26 14:36, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
> clean I3C support, cleanup patches for the pinctrl driver were also
> included.
> 
> Thank you,
> Claudiu
> 
> Changes in v4:
> - dropped patch 1 from v3 as it was already applied
> 
> Changes in v3:
> - collected tags
> - added a fixes patch (patch 1/6)
> - dropped already applied patches
> 
> Changes in v2:
> - collected tags
> - dropped patches for configuring I3C standby
> 
> Claudiu Beznea (5):
>    pinctrl: renesas: rzg2l: Generalize the power source code
>    pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
>    dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
>      power source option
>    pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
>      power source
>    arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
> 
>   .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
>   .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ++
>   .../boot/dts/renesas/rzg3s-smarc-switches.h   |   4 +
>   drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 254 +++++++++++++-----
>   4 files changed, 204 insertions(+), 74 deletions(-)
> 


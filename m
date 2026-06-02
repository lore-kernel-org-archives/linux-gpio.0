Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF62765DF;
	Tue,  2 Jun 2026 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404487; cv=none; b=hYkK8nwCQoHh3Nl5OvjL8Q+CXTCMN8e01FWWfS71eRyBXUpIABd4jr4IdJ82VgmOtdwlp6+uzUWxum+GXGyqap/EeMLslDBD/WnjRgGvIzhH9Z0crf4wnueb6Ril3qsv/0yweEsQfFS/xrEuD3tVlipp1sb5cV+NMlGWKguIMgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404487; c=relaxed/simple;
	bh=hxB82OwR/c2b5AF1j39uyClP13FSUWRKhi3oip7J4bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkXP6yucm3B3ruUOY3TSuhOKRYDDx6XI2/HyZXs/696DKGoWTSrhq+8K5NrBD5GZYuclOg0don/AQc36pM6nP+gFVC5rYOY3xIphlNSAZ78HBYM99sS3OIHqQUai3nL1AILZyHipK6rNnO1oDpu684F0PHSFhXMRBeaj6i1PIWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZcnb3Ne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZcnb3Ne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B511F00898;
	Tue,  2 Jun 2026 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780404486;
	bh=iCZKbEEGJwyGjbTw3VbjcJ0aH82ATivE84+H+5iwvjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BZcnb3Nebu4GuTulLEBMCdckbcc/FKFhUO0BIPGuDrQOmqVvI8dStqzOjSmXLa3iG
	 tx3jsarm7muLQB16y2j3nsqkJZg6Yz4OWd+FkHIEFRQlIS6SIfBqL3ZAYxl9EAtbUt
	 O3W7Eu5jsGe4DnXmxCUmCBnJdd9SlJcp2Ejpa2W+aYFLWpwiWb/UYRO547pWB5gKYQ
	 Z0QIopr89UhlZKfVHYSMT3C7ubCMMrDWH1u0AeDkLlH4tP/izVMZybkt5fBHzvfgXB
	 6+MyaFn3LSS/CHwSGtZ441/6z+tiCUcrQpnhSWcaGO0J2yp+uaZkNmEmIPAnm+2Yjm
	 zNKPlBVpvb49g==
Message-ID: <385c0e3c-f131-4d38-8d82-0e0b4ab8e96a@kernel.org>
Date: Tue, 2 Jun 2026 15:48:01 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <ah7AAgK0plmNfL5C@ninjato>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ah7AAgK0plmNfL5C@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/2/26 14:35, Wolfram Sang wrote:
> 
>> Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
>> clean I3C support, cleanup patches for the pinctrl driver were also
>> included.
> 
> I am ready to test but this series doesn't apply on neither master nor
> -next of today. Could you kindly push a branch to pull from somewhere?
> That would be great. Thank you!
> 

I pushed it at [1] along with the v2 that I'm preparing for the i3c driver.

Thank you for checking this,
Claudiu

[1] https://github.com/claudiubeznea/linux/commits/next-20260601%2Bi3c-upstream-v2/

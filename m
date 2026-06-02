Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35A121B191;
	Tue,  2 Jun 2026 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407559; cv=none; b=neb7WhB45B9MuYVQACDbrGcrelLc04zcIRjG8SNlUu4z7rWCVnexO+W1nyWvsEEsDdjpEUysTVt9xF7GU5j1bwsUz5UuzuPFTQeS9g3MG1aa6LP8eT6TDvMZGsC+2wVJl2+K4IuiRAd9ZStEn/yEc2yNEkboxCxlZYSDppnaJgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407559; c=relaxed/simple;
	bh=3EQxzVNztSTsOS2ipwUXb+4AS9Osy8Vos05K7d2cAjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvKE5vHJjKX6Vvwx6OiOC5gIjEL0KDW5G8Xl2kd7wjp8iMzBrCs6ul/86Xh0lByWj2uIC64HYj8o1ZWUS4IFBe9ldJ9eamQYmQk1EfBS8YT1ll1e66PGZmr4dRNRhvMzcusJRVftD7jeF5z8jkf5zdBmg+00AHC6tZCscdgfG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qxuw9XC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qxuw9XC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7887D1F00893;
	Tue,  2 Jun 2026 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407558;
	bh=Q4CWuADEj6EQIjdM4cIi9b+k6O1l1w5BcfrVRUqAyZw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Qxuw9XC1NKit4Or3T2FNSI9QvKU9ivyay2D5rCtpvV6hQOtOZDOw3aGRpF0KzxpLv
	 DuKdal+JYJCuGL/fY80OV/fxMM3jztfpFrnP+rbXCT6chIqmKJwAjie1p+ixOJDSQI
	 Bpr9iWfJ0205E81XzhoiFMYki7zWQcQ2EZ+NVlL7zTX2SiK55BTMTU1mh4ecS3CAhM
	 apk4DhsapB10mLkWhMXg2fc4GEKjN7u5+jXoaHibwUh9m1R65jVYkpbP6+2lWs9MCV
	 tYPuq+lMjwKiHIw5nUaXnfQBdO6+KcPe5JVCEUG9LFKKYUOONl6eeE30LJWz/mBIQJ
	 YZ6ZT1ULwmvjA==
Message-ID: <7a72ebf7-a8de-4ea8-bae3-382aa5eff18f@kernel.org>
Date: Tue, 2 Jun 2026 16:39:13 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
To: "geert+renesas@glider.be" <geert+renesas@glider.be>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <ah7AAgK0plmNfL5C@ninjato>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ah7AAgK0plmNfL5C@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 6/2/26 14:35, Wolfram Sang wrote:
> 
>> Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
>> clean I3C support, cleanup patches for the pinctrl driver were also
>> included.
> 
> I am ready to test but this series doesn't apply on neither master nor
> -next of today.

That would be because patches 3, 4 have already been taken. Applying 1, 2, 5-7 
individually still works. Please let me know if you would like me to send a new 
series containing only the unapplied patches.

-- 
Thank you,
Claudiu


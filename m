Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACBA517BD1
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863713; cv=none; b=WzdxVC9CoMr21OAjcNqC4XxGWLFYCUsWjlPjQpMr3c6cUpWbEmAW35SSjzjPM2NaQKbga1SL+qLWXoWMnhmQAs8h5JCXaArHsEXJFXc/UWwk63q5WOFQC3vhDt0vypDJGphbqjAGnKfW0D94/zFNypijGGetE0FkNMF4KScYL3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863713; c=relaxed/simple;
	bh=7Cog2nkDO+lKZqVVRGnvxVjru8LcS09xNUgvu87wQA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyYX2z5bjV/OoQ/dpx7R4IDMV4E1EVNbrz8qFoUnKVMCYR/uBcylVN4dfaVdpQqU2u3nFye3qa/txAYqRCTp6fdPt99AhAkZfkzcTuWKIuUK+BHMuj2bqtFsjEJ5qYeehQ+9vjK0uKMWHfVpQR3zEhSYgczon7JFHvCv+ktYLvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xw0JsCwG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xw0JsCwG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso48331715e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863710; x=1789468510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPBRY5QywHVL60y+J3dACmXSkYJynfKQaq7TX1tS5GU=;
        b=Xw0JsCwGgTJBJUOdgJQ0/PV5QtezEwGc0jNutB1Gw1zv8reNebQGdiefiaHa8KRr7U
         1hMyJ3apnPINs0U3xivR0HvBeRSGdr4veM9pY9lS2KYFV2jS1Oh96h8RfW/hvmKqmW4t
         0ZT+THY/QnLX+luO1Bw7BwROOdexDWheEZguw2Akhrhz4CylHupCIPu1I3iOowkRZ275
         fD+wAN+sjY3BCTr1l60LconWYoTD1M5bqD3KpLk2cZU42HqFhsfscDxaXEq3TbRxR4kD
         p+/D4o+k5TOHI+AyPknq9gcaaWMNWMcKYlfoH1ZcR1Xsn/rzTcZgyP7HHU6qebFfva2r
         sjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863710; x=1789468510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPBRY5QywHVL60y+J3dACmXSkYJynfKQaq7TX1tS5GU=;
        b=bBo3hhdtKh+cWoAjbijEYGiPdBsDnzN58+4SNOWw6ke4NAzkRkGzzz5PwDlF1R/lFu
         9ajrwqv+fjiCJ/E3zskxOmQV+gG9c0XX2NkH0mRZ+U4rh7qJklEKD2xIpn4CThEM9SO3
         2pF0xyGu4GI5C/KdGrC2yNo4rh0zAKvm08ZU98fWrxlqIOAm1oLp/R0KFscS+HPMEhBz
         478Q2COkdqZK+lQhzqlU6JnJQPMMTZxRPtirZfJ/+djZI8MTOmHNBr5uPjVpdwom96+3
         9Bk4xnxLKDrwDvmWXR5aD5QK5J7u6x1fmSoK1loiQCnMC21uIf5IB368PlD9EJiwuVxc
         gD3g==
X-Forwarded-Encrypted: i=1; AKwUvBzOOrAEoFZTTYVLBuNH8UphWPoV/lw7Tn2XdLMSH+y90/hSk47eNYZIkSjGd3cgyLY43l+jQCfRIfXL@vger.kernel.org
X-Gm-Message-State: AFuF++kL3whPEWLSkHDzZn5WDJnDdu+Z7leEwoi6xELJNkbHvJUdRCcr
	cgsxRSGSrbbfmgWG2gBJUKNP68NPR47ADq1BtUu8BVTFMyC+f7mC/+t6
X-Gm-Gg: AYBFou0FyZ6FkID4xmNM2B9hnStYvsnLl8vI600bmzzp2szKYWpyYjugm2En+Z/OZpo
	TVKXDbdTgTWV/yfhcUEFCJq/MbQ6p97qtfyL7pXCYsEawPawIfMma5xoNFxvCl8WCYJurZYtV1H
	WV5ummYVH+BFvRknn2WU/YBQOWXoP8tjZaYwNgXYQDdmG8xAV6CBhhH4nCQhlvTAEERrgwvtcSo
	KwvcPNaJpwcmd/R9tneO+ac4njw/l16FvO+TqGZsvdJkJsxhDvOFKnOMVwqUFAZiBcjI7yIO2eG
	c8h4UHCw9oJCklrEW6oQWyxkzkZkAFKoLDn2cuAQeu9k/1flVWtMH8aJKizW5YMjM0WTfGPrFt1
	leM2MMqfAui7r20Mc6N1r1aySnU/IVbbPsW15gDY7tTIcNEp8h2vkh3DeME1YGAs2GM3hQ9eRQX
	3g5ZZdyd+LsfEqEG+1CcvU9ERBjqTcBicq34VvYGAYr1Gi003xR5hcxvOlhwsnG3U4P7Ehy1H1
X-Received: by 2002:a05:600c:8b05:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49cf824e751mr303216285e9.9.1788863709661;
        Tue, 08 Sep 2026 03:35:09 -0700 (PDT)
Received: from [172.31.2.29] ([188.24.0.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm236442825e9.1.2026.09.08.03.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:35:08 -0700 (PDT)
Message-ID: <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
Date: Tue, 8 Sep 2026 13:35:05 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <apqGlTiybdvQX3Ao@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 11:51 AM, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Mon, Aug 31, 2026 at 04:21:19PM +0300, Dumitru Ceclan via B4 Relay wrote:
>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>> replacing the few GMSL2 drivers already in upstream, and introducing a
>> common framework that can be used to implement such GMSL chips, which
>> avoids code duplication while also adding support for previously
>> unsupported features.
>>
>> While the normally acceptable and polite way would be to extend the
>> current mainline drivers, the choice was made here to add a totally new
>> set of drivers. The current drivers support only a small subset of the
>> possible features, and only a few devices, so the end result after
>> extending them would in any case be essentially fully rewritten, new
>> drivers.
>>
>> This series depends on support for internal pads, for which a patch has
>> been added.
>>
>> The previous version is at:
>> v15: https://lore.kernel.org/r/20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com
>>
>> Since the previous series, Cosmin has left Analog Devices.
>> Because included changes from previous version are trivial, his sign-off
>> and tags were retained.
> 
> Can you check this
> <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> please? If there's a single patch that needs to be modified, I can squash a
> patch into that, otherwise v17 it is.
> 

These are the same warns reported by Niklas in V13. Dan fixed them in
smatch in devel branch but fix is not in master. Testing with smatch on
that branch yields no warnings.

https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7

v17 is still needed to revert one breaking change introduced in v16 and
fix more findings from Sashiko.

Thanks,
  Dumitru

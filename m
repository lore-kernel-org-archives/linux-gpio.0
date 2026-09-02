Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226E3FE37C;
	Wed,  2 Sep 2026 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343066; cv=none; b=ujip/q72brAmjPKdEplWDvMiio+1WJkaXexzAAtkf4q1NAQbEoEuyhRDQ8la8OznFCgN5zf1Nb0pJHyX3ti9qOQENNfbyHxjhNp61K87mU8m8soxqrQbRok6MZJwH7H8rRYzkwTFkbo0Z6O9D6HNh+unAbdINMA+KYafyxt8/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343066; c=relaxed/simple;
	bh=9j2Ki5GPWGYkmeARIMt8ZvDgPX6hctJeBXHPtQmb6e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCfku/C7hzdCC5nyGAUCsxjJCyKb/Rnd9Gm86HY8hqueaYU83Hr0ZAkEYYrJassqiWdM3WAXACB/DBCJ80oOIFVevIxPYIkRoNSGnaLKIf2QyEYlUWEcXSMlUXB3iQQGUaqWnnUIcSUHU/5hc37nPPbtNabLJ41Tq/4S4oNnc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vj+5c9vx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vj+5c9vx"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D21071F8;
	Wed,  2 Sep 2026 11:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788342971;
	bh=9j2Ki5GPWGYkmeARIMt8ZvDgPX6hctJeBXHPtQmb6e8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vj+5c9vxvm1NYRM8prIdCcKaN5O+Jh8/21rrP7zR0b2x2JlyX9TxlROE5P8tlgiE6
	 AmRETcC90lo0IC+tdBHSLnOOGiJTZNWiSqYbekvLDi2O0ZA4N+J7xHfS8yE8/6X9mw
	 WRIsZ65ar2K9BlASHgFy9v3Va3XSfOkFNtRHoAmY=
Message-ID: <91be6238-0379-4c3e-b617-f0e1c4ed5cf7@ideasonboard.com>
Date: Wed, 2 Sep 2026 12:57:37 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, dumitru.ceclan@analog.com,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org, Martin Hecht <Martin.Hecht@avnet.eu>,
 Andrian Suciu <Adrian.Suciu@analog.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831170303.GB1116206@ragnatech.se>
 <65b703e7-e4a0-4046-9d35-7d0ff1057f96@gmail.com>
 <16626ec7-d1ec-4a54-ad1b-a59790cd33e8@ideasonboard.com>
 <20260902083750.GC1116206@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260902083750.GC1116206@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/09/2026 11:37, Niklas Söderlund wrote:
> On 2026-09-01 10:43:44 +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 01/09/2026 10:39, Ceclan Dumitru wrote:
>>>
>>>
>>> On 8/31/26 8:03 PM, Niklas Söderlund wrote:
>>>> Hello,
>>>>
>>>> Thanks for  your continued effort pushing this work forward!
>>>>
>>>> On 2026-08-31 16:21:19 +0300, Dumitru Ceclan via B4 Relay wrote:
>>>>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>>>>> replacing the few GMSL2 drivers already in upstream, and introducing a
>>>>> common framework that can be used to implement such GMSL chips, which
>>>>> avoids code duplication while also adding support for previously
>>>>> unsupported features.
>>>>>
>>>>> While the normally acceptable and polite way would be to extend the
>>>>> current mainline drivers, the choice was made here to add a totally new
>>>>> set of drivers. The current drivers support only a small subset of the
>>>>> possible features, and only a few devices, so the end result after
>>>>> extending them would in any case be essentially fully rewritten, new
>>>>> drivers.
>>>>>
>>>>> This series depends on support for internal pads, for which a patch has
>>>>> been added.
>>>>
>>>> It also depends on enabling the streams API right? At least I need to do
>>>> so to be able to use the TPG. Out of curiosity do you know the plan to
>>>> enable it by default upstream?
>>>>
>>>
>>> I do not know when default enable is planned, but series could make it
>>> so VIDEO_MAXIM_SERDES selection causes v4l2_subdev_enable_streams_api=1.
>>>     I am not sure that such a hack would be acceptable by Sakari or
>>> upstream in general.
>> I haven't tested with this driver, but in theory these kind of drivers
>> should work with the Streams API still disabled. The Streams API is a uAPI,
>> so the driver itself works without it. If the default routing for the
>> drivers provides a sensible single route, one can use the drivers with a
>> single camera. This is what the FPD-Link drivers do (although it's been a
>> long time since I verified it with Streams API disabled).
> 
> Indeed, but to enable the TPG I need to non-default routing ;-) Nothing
> big I'm just impatient for the streams API to be enabled by default in
> general.
Yes, that is true. And annoying, if TPG is your main use case ;).

The FPD-Link drivers don't have TPG in upstream. I have patches in my 
local branch, waiting for internal pads.

  Tomi


Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F22043B6EC
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183432; cv=none; b=i38+12oex0WA1fxloyrmBjkcHHxAYyz71sEYfDpH2mwRXM2Ioh1CO2GH70iJJ3umLi5jk80MrfioXrWil92CU810RPPX9dNu3ZSsoUV8Ia2juYkAhkK8rZfTgiI/AzFiRurCuFBQHBtrr63Hxp14aXlwjTzFof2iWcqp4kFLAhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183432; c=relaxed/simple;
	bh=+crV5aMzmvsMqDok6yibOvFk6mwHBFaHijEaoyXxk2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGRsm1AgrIhL8iWYGgdKhuypqlhmMtIIvaba1HY82QZKmpe/Xkbols5K0ou/BBAzzhMx88K/JmAR9/tV2+SX/PwiG0cpiJZ4qaJUJv8xg3FdxQrLq+LnOkQu2WZeyNeTB6OsHTcGrA5ACsL27tHbPA+mmUxD1W1NRHR+yktyYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srHLz8wZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srHLz8wZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso24124045e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183428; x=1788788228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UmvoqbZ8X/pbBv6+Ee4BUY62pNZyn3Ji5DwA5JfziI=;
        b=srHLz8wZqiEnmOu8qfFBZT8/WcNk+i87gzecbpbcYxuV5Gd1ZRJA6bY2ySkr5EcZFZ
         xM/KSgnI4ucHco6VsjntxRYH26Ql1pN8njKjkUWP0wyr+OFjsJB4TP09K0U4vYFQ7t8T
         anyGWSZeGkL8x6Eioqre+vAHHcYefs4u6//Zh8pWcBhJxao0/YjGuuA6QXgfhLUYzMGr
         TqpiGFY76Axa9FcGZfvkwWrkiBIx7DpGZHZ4xauswrfu7RqLZvdwDEBmRg6izA8Vx/nF
         OP8fbCnSOUwbaIYMdVJi1pTFWJrqNU0NTcyIyGW1/YEJ+6gNhQMHQCt7wAdSVgl5l2zF
         6TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183428; x=1788788228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UmvoqbZ8X/pbBv6+Ee4BUY62pNZyn3Ji5DwA5JfziI=;
        b=If4wEVxJ9vtwhsf4wxp+9evCpI+yVTXQB8KEuoCgUhM4nw3M8ipscFCTRLf7oUkC33
         CNwpIbULtifNchFVRaqXkncEIzWxroZPLmgjEubJ3lsBk0IGSFMzJTATo2cCjmyNF+vr
         UgrP8rFZPzg8gScywY7cCfqGlH1/7ankl3z2/5IAiWnmi7xU67/y2DCQH8VpoduD2qm+
         tYcI3RPUD3TnrFyRvG2C+eF+/JP3a6bhULkVl/9LDhH8vsFcy+IxjnWf4JnE4ZPzbWXN
         7+PZYjxcL6yKtiTyHdduRNWh75seueJxfOurmOogEaALCO9kccbx30TZAD0WVoOm0bYj
         zGkw==
X-Forwarded-Encrypted: i=1; AHgh+RpQrrr1a0quLCZt/QdqngL08oSRUVmuKigyiVUb3y3usF4AuRYaNkECR3eRnAbARD0ZKvcvH89JmQY6@vger.kernel.org
X-Gm-Message-State: AFuF++msgvLTam1caBav3tICcJfgWSSfCc9v+qUoT4/0gwaJNjq49j60
	+Vxkh6A2D5j98h0+UefQGzHXr2IlDTukyPRCt937B85bfaIUpsMoXyAP
X-Gm-Gg: AR+sD13AG3PFLzUycUG9+qRNl94wh/2gE6NkuMrUv90YbIF4YeC48866IMOXpeNG8lW
	PQ2OVqo26uY+NHBRTFOMBtEJ6/gc7hghmoHeBHCIQ1RhQYzKH2M1i1rAsjrp+iy8m7QDEAYvYi1
	KjbhcK7qKmsIbcTpAR4quDHMRjKmIRsKAgdk0nZl+z/gDxff4ED438/HIaXiuTxgN1/ZpLbOPfo
	dEWwiso64sESTnK0Mmfn84tW7S1uIDJSWLZkTganavTeqS9rVaRJKjJ4n4t62r1nZDigQXV3LCG
	TrTTFqxHg9dTyoa7ktc8TtoStiVk3DW2DO+edXvFuF3DUJ9NJJDOEUo3g1OLyFarx7CzUn4mnux
	gmwAyh3tVG3hhX0RpkhGfgjPuhVKm0GaMUo+pYif0IirFQ+gOs/TzSYcbSsH+Tt0HtjfYKRwA4h
	0CJ2IZ3o55sWyUiLytuSJrNcT2+1Q/aWdjmICxvH9Jr8vmXeY6ADMqUIGY02MxICI=
X-Received: by 2002:a05:600c:a03:b0:499:a8bd:1930 with SMTP id 5b1f17b1804b1-49b91c20ba0mr375282175e9.5.1788183428335;
        Mon, 31 Aug 2026 06:37:08 -0700 (PDT)
Received: from [172.31.2.29] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm346376465e9.4.2026.08.31.06.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:37:07 -0700 (PDT)
Message-ID: <f48c0b59-0d6d-4b99-8990-2473919245be@gmail.com>
Date: Mon, 31 Aug 2026 16:37:05 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dumitru.ceclan@analog.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <d0537d7f-6e74-4cca-93ae-398530c5cd51@ideasonboard.com>
 <ao_5LDgGjzvPZVXU@kekkonen.localdomain>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <ao_5LDgGjzvPZVXU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/27/26 11:45 AM, Sakari Ailus wrote:
> Hei Tomi,
> 
> On Wed, Aug 26, 2026 at 01:15:03PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 07/08/2026 16:02, Dumitru Ceclan via B4 Relay wrote:

[...]

>> The deserializer TPG gives me no frames at all. I recall the clocking for
>> the TPG was quite a challenge on at least some max96 serializers, so maybe
>> it's related to that.
>>
>> The serializer TPG worked, although I think there's something funny with it:
>> the initial frames (maybe just the first one) seem to be truncated a bit,
>> there's black at the bottom. Another, a bit more unclear, is that sometimes
>> ser tpg stops working. If I'm not mistaken, what I did was run cam0-tpg +
>> cam1-tpg. Then I tried des tpg. Then cam0-tpg, but it gives me nothing.
>> Streaming with cam0+cam1 video "resets" things and it all works again. I've
>> seen this a few times, but there seems to be some randomness so I haven't
>> been able to pinpoint it, but feels like there's some extra state that's
>> left behind into the HW.
>>
>> All in all, the normal case (non-tpg) works ok for me:
> 
> I'd indeed either fix the TPG before merging the set or postpone adding it
> for this reason. :-)
> 

With V16 TPG deserializer and first frame serializer issues were
addressed. Also, we could not replicate ser_tpg not working with this
revision.

Thanks,
  Dumitru

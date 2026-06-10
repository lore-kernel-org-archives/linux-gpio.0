Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DF7373BE7
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079159; cv=none; b=OULGwOsE5UCnRNfW5dDEUq/ZrQlAUB1G1KCKof20nWgLpycFxcfSDr80hjueQHYFTN27B0eNlIzNXkV+Tn+OCIdmanPxMRTBzQjzzd5S8GvfKkY0R3UNNIZhyxRyA/MO9KHa7E1rgVvuM+6X4ZGuqkBoAyDaxwpPHk1puQ+6y9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079159; c=relaxed/simple;
	bh=4mwHl9PNysy8+RZN1bXqjKp7s71VhNN+Q3iEQFzfyPU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBhuBZuJY5nqGqp7n7qDFdkkTH8xpk19/RQeL8ydAI3yC6n4A2MFDCQUhAlXyaPwb3gbOIQsxeAoE/Op3MUGwwuo8lIszwsSnvhbqpIQLaYB083LXAdpQQ3P4aOvVzVldsiA6t1mlyqEd2YYryRu665e4fVOq49iDubhOIn1RVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdYsFjcy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdYsFjcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92731F00893
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079157;
	bh=ZbI8Urbr2Q3tleFAompxSXNCXqzrQkYGwOIHyxDN/LA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LdYsFjcywuTy7mrt39eS9W0oe5NFI+o+pq4T5eIs7c/Ap7r2S9FenFrkrJ4LQ4WMO
	 BAyM10eB8+LMGPrGHK9qcaEkjc5A10aVHEV3KS4ngsLD7dpZ7XpaAf2P0VKFjfNdni
	 JEEZfg1vFBIZp/WoilaDpxhGxMuVoO2N30wDgcVqGIkDKcHA0eeUBHYtVvqXhSZY5H
	 qxYI9rMMBZm9R37dCIy7cChRN5aJDYzDwOx5E84w1Ot+q6p14GK3hpYs+FkIJJIIuC
	 m92GqTRpQDGfjPy7fkG6BU/ViXr3zZ4ClxzHCbYJUO/lRgWv9IZGUmhbC28OjNFXbn
	 x+9hG3ByQYWMg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa68dbb38aso6211657e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 01:12:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YzkOesI9dUpVUNcck4B4FmcmK0/BFiv+yC5Ddhh/IhS6h1exgvP
	Ya4jbvL831zImr0NfY73r5yciJX64wwmKHpAMXKEZ+jwjv0fhSw/EQjv8A5faX2woonRW0LabAB
	0ggRWXEYWUoVHjEjHz1foRgadRNxMcuqjpvPQH+NFig==
X-Received: by 2002:a05:6512:a95:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5aa87b67121mr6303418e87.4.1781079156554; Wed, 10 Jun 2026
 01:12:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 04:12:35 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 04:12:35 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <b07f5bd8-26f8-4de4-becb-4f76f9d33361@reactivated.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608210108.36248-1-dan@reactivated.net> <CAMRc=MfUd3nwpjgz-87hrpQ9AV6T8_1zwCm+tfYFurkYHKoKTw@mail.gmail.com>
 <b07f5bd8-26f8-4de4-becb-4f76f9d33361@reactivated.net>
Date: Wed, 10 Jun 2026 04:12:35 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdAua7kYE4frVChvAd6WLx481kNkDxCoRok=yu1xWsHTA@mail.gmail.com>
X-Gm-Features: AVVi8CfB9EEOMfsuxi382PvIoAy-V3UWY7_s1-8Dm3hFe2jwyNK3NhOMizS5ME8
Message-ID: <CAMRc=MdAua7kYE4frVChvAd6WLx481kNkDxCoRok=yu1xWsHTA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: handle gpio-hogs only once
To: Daniel Drake <dan@reactivated.net>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linusw@kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 22:48:03 +0200, Daniel Drake <dan@reactivated.net> said:
> On 09/06/2026 13:39, Bartosz Golaszewski wrote:
>> On Mon, 8 Jun 2026 23:01:08 +0200, Daniel Drake <dan@reactivated.net> said:
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index 1e6dce430dca..b02d711289d0 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -1031,9 +1031,17 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
>>>   		if (!fwnode_property_present(fwnode, "gpio-hog"))
>>>   			continue;
>>>
>>> +		/* The hog may have been handled by another gpio_chip on the same fwnode */
>>> +		if (is_of_node(fwnode) &&
>>> +		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
>>> +			continue;
>>> +
>>>   		ret = gpiochip_add_hog(gc, fwnode);
>>>   		if (ret)
>>>   			return ret;
>>> +
>>> +		if (is_of_node(fwnode))
>>> +			of_node_set_flag(to_of_node(fwnode), OF_POPULATED);
>>
>> Sashiko correctly points out that on errors, the state will be corrupted. We
>> could maybe move the clearing of the flag to gpiochip_free_hogs() and track its
>> state when processing fwnodes in order not to clear it incorrectly?
>
> I guess you are referring to:
>
>> Does setting OF_POPULATED here cause state corruption if a secondary chip on a
>> shared node fails to probe?
>> When multiple gpio_chip instances share a device node, the first chip processes
>> its hogs and sets OF_POPULATED. If a subsequent chip fails probe (for example,
>> returning -EPROBE_DEFER), its cleanup path calls of_gpiochip_remove() which
>> clears the flag for all hogs.
>> If the flag is unconditionally cleared, will the deferred chip attempt to
>> process the first chip's hogs on retry, fail due to a mismatch, and
>> permanently abort probe?
>
>
> I don't think this is actually an issue. If we have two gpio_chips
> sharing a device node, a first one with a hog that probes fine and a
> subsequent one that fails during probe, both of the gpio_chips will
> brought down and the flag is cleared. If it was a EPROBE_DEFER case
> which is then retried later, the first chip's hogs will be set up a 2nd
> time when the probe is retried.
>
> It is true that the teardown of the 2nd gpio_chip would erase the
> OF_POPULATED flag of a gpio-hog node that it does not "own", but the
> first gpio_chip would also be torn down at the same time (and
> OF_POPULATED unset a 2nd time). This is not ideal, but harmless as far
> as I can see.
>
> I don't quite follow the suggestion for doing the clearing better in
> gpiochip_free_hogs(). It would be neat if we could go from a hogged
> gpio_desc back to the fwnode, so that we could only unset OF_POPULATED
> on the fwnode at the point when we are really removing the hog, but I
> don't see a way to derive the gpio-hog fwnode from gpio_desc. Also, this
> would be complicated because one gpio-hog node can hog multiple gpios.
>
> Let me know if I'm missing anything or if you have any preference to
> handle this differently!
>
> Thanks
> Daniel
>
>

Ok, thanks for the clarification. Let's give this a chance then.

Bart

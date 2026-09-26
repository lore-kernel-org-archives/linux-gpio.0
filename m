Received: from sender-op-o10.zoho.eu (sender-op-o10.zoho.eu [136.143.169.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F4547059
	for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 10:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416847; cv=pass; b=BVMFIyOz0RygnHGEfW/qHg67hY2+MllexcAsHmJr71YuBZVbutkT0MBumj81WtDo5I9vKQA4RS0nW+xPxTIELnNecketnJ9aXOb1LbPY+39XL2RPtxS+b2LzAQqUrpmY+BnuqEjK1reu+6Pbrm2Wsib1fkRn4RMfxvFDtoIU55o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416847; c=relaxed/simple;
	bh=CGnPmNrRi/C3b+y0/yeV3fEWnNxxwpkDlCp6VUb4Roc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=O0ED/Bqn2cgQiJf5gdRtsJaaOxrNPSo9X3Ya66MNHbPyqkctKzftqLDrlv6zBG7Y+snBx5n1ZX1Pdob0X6BDRsnmeOxi6ALhx9AD7EF0mv+ffFft7hFiU15TY5H51jegG1vEGLkH72604E3rK1k7U4+wg4rb4FznNDkczBsv8SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=HurcRjDQ; arc=pass smtp.client-ip=136.143.169.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="HurcRjDQ"
ARC-Seal: i=1; a=rsa-sha256; t=1790416805; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=CxZZZ+OQ+mTWaKKbXOSX3gby081KfFggc7jrvcZXncWyH5u6angmUOMcP3+zIQU9o91B2wBP7EucQwRq1kY2JOgDT1Y8/hhPLoLxUIRqj23FkY1ZOS4/ipvvMYs0X0JLiY2oRQKok7ubgUjVIVHXn4FbuQpILnQxMnYXjvvGvfM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1790416805; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wWAYD7hM9uoXDMeoHMfgdsnAKhjV8aF2ErHrkT+OIZM=; 
	b=cPXXQDOtrj4f6wqGsqrHZmY3p5K3iMTWbfo3Wqa5hZvbmXcGC1HHLLRGuOATDoNYQArDknirWK2krW5mih3XEWPqcfzijY8ti6MhOE7G/yX/0DPmZtIjlx7Ev5ujg5l0QIe5hYG3L0jX23GFMFisXbYSCeQxKyFXG9IljrYykLE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790416805;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wWAYD7hM9uoXDMeoHMfgdsnAKhjV8aF2ErHrkT+OIZM=;
	b=HurcRjDQyJGdLCuZ2lvQb9QwxphS1Eqr9fvYNJHr56sbWiNFIWaAbldn6dbahZkh
	MHUrgd4IfGtQ0n99fVN2zKh0BN40QJ1MxIHFL7CH8/LKz3Da/5F1txCMmk7w3qpLYvr
	aMvN937gmTUOju/Lsb8Tpomca+iVl+NWTgva8oPs=
Received: by smtp.zoho.eu with SMTPS id 1790416804412828.3370933618166;
	Sat, 26 Sep 2026 12:00:04 +0200 (CEST)
Message-ID: <b16be8d9-eadf-47df-86b6-4a982c665f9f@redaril.me>
Date: Sat, 26 Sep 2026 12:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fabio <development@redaril.me>
Subject: Re: [PATCH v2] mux: convert to use fwnode interface
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>,
 Fabio Forni <development@redaril.me>
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, xu.yang_2@nxp.com
References: <20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me>
 <araS8BpKyYI-nkxM@analog.com>
Content-Language: en-US
In-Reply-To: <araS8BpKyYI-nkxM@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> @@ -566,39 +569,40 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>>   	}
>>   
>>   	if (state)
>> -		ret = of_parse_phandle_with_args(np,
>> -						 "mux-states", "#mux-state-cells",
>> -						 index, &args);
>> +		ret = fwnode_property_get_reference_args(fwnode, "mux-states",
>> +							 "#mux-state-cells", 0,
>> +							 index, &args);
>>   	else
>> -		ret = of_parse_phandle_with_args(np,
>> -						 "mux-controls", "#mux-control-cells",
>> -						 index, &args);
>> +		ret = fwnode_property_get_reference_args(fwnode,
>> +							 "mux-controls", "#mux-control-cells",
>> +							 0, index, &args);
>> +
>>   	if (ret) {
>>   		if (optional && ret == -ENOENT)
>>   			return NULL;
>>   
>> -		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
>> -			np, state ? "state" : "control",
>> -			mux_name ?: "", index);
>> +		dev_err(dev, "%pfw: failed to get mux-%s %s(%i)\n",
>> +			fwnode, state ? "state" : "control", mux_name ?: "",
>> +			index);
>>   		return ERR_PTR(ret);
>>   	}
>>   
>> -	mux_chip = of_find_mux_chip_by_node(args.np);
>> -	of_node_put(args.np);
>> +	mux_chip = mux_chip_find_by_fwnode(args.fwnode);
>> +	fwnode_handle_put(args.fwnode);
> 
> I'm actually not sure why there was an of_node_put() here in the first
> place. It seems wrong to me. Any idea what it's for?
> 
> I want to give a Reviewed-by here for the rest of the code, but if the
> above _put() erroneous, it might be better to add a patch before this
> one to remove it (and cc the stable list with that patch).

I don't think it's wrong, because fwnode_property_get_reference_args() documents that:

     The caller is responsible for calling fwnode_handle_put() on the returned
     @args->fwnode pointer.

What is wrong though, is passing args.fwnode to the dev_err() calls below after it was freed.
Or that's what I'm inclined to say; I doubt put() would free everything but fwnode's name.
If I had to guess, fwnode_handle_put is (erroneously) where it is to avoid gotos/calling mux_chip_find_by_fwnode()
in the sad path.

If you agree with the above, I'll be happy to write a patch to fix it.

Regards,
Fabio.



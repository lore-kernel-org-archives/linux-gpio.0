Received: from sender-op-o10.zoho.eu (sender-op-o10.zoho.eu [136.143.169.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A3A4B0CB5
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579045; cv=pass; b=gyQk9hMTaO3IploYcsBHte0qcpRvb5Vk1B0MBytcY+a+ZKvgW+6IGnP/vc0TwrbjJ5IsRxocJz6KMyqKKhjQlmJPVq70ib+MRraE7skKVgXb9hFMsWeVn8kzBgdc6pwvt0CBj3Q1qdLxyHqq7BI1yu+mP46zfHD20tX14Y98X/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579045; c=relaxed/simple;
	bh=oAa3SBrrTjLoox+i4iUmhXb/fwu1/bR1IUV7BRob+JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPe6HmG3Jn3KHccvZnlGX/ZsSUzLy8hgBr8m0bnzIlWofF3L5e3LptpA5ORYU0H2QoHc4g/6R7hbk07lz19KUlkiagCwtaFg1vNPX6X8cU8ihrKRAFhtHoG41LdikZXVoJIaGFUlovGAIvbpPAl+19B35a88v81xBAoRj51Fm/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=DDaxLZFU; arc=pass smtp.client-ip=136.143.169.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="DDaxLZFU"
ARC-Seal: i=1; a=rsa-sha256; t=1789579008; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=R9besDUi/p53nZ+fAI2coxLJETH96+HzEAj5ywrBEPoSVZHn/TYhBjtXuplhfZoh9igNaGEGiNba5c66wMPHFAdQBpALSAICRilzDwy1Mf/zMnCXWXgeG+FAB4wyb6Sq6HQx1iyqF5DH/NXbDwiBn/anwZkLkqXcs4Q/RCZ0uzI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1789579008; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Blv5jiN0BR3ipsn4O8tc3Bw4Ar3/gMwpFNNVRV9eNjk=; 
	b=dlAmWZASbUMoHh7l73hLw2oJCfaQk9cgD+wyrqKqGfoO3YAgEWp5DNrhDb+ZDr2EpxgaPkLCaHObEV7SNzEcuae6NYOTiSZeGh9cexV5e5Q0XWobPlWfSVmnn595ZpAIgq+lWd3jiw423uMGfU6iatAAj4QDar2lROB6dD1TN50=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789579008;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Blv5jiN0BR3ipsn4O8tc3Bw4Ar3/gMwpFNNVRV9eNjk=;
	b=DDaxLZFUtBhNPsZI+/6rfUDwyKcTEyeqwuXhyXqn9uQRtQcPJ+XPQdSuq0mwYhoo
	WiEC9QGUPrtMjuCBQd+RyALqqFTOPi4DrcvnI5EGJBwARzcmzWL78Uw/vmU/9gC+NgW
	QwM8sOHBCiMd/JiOUGFNp1RYZXJGrDYpGLFHvAgk=
Received: by mx.zoho.eu with SMTPS id 1789579007499959.3930304878398;
	Wed, 16 Sep 2026 19:16:47 +0200 (CEST)
Message-ID: <b4f7c0f4-199b-4ab2-81b3-277f08d41036@redaril.me>
Date: Wed, 16 Sep 2026 19:16:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mux: convert to use fwnode interface
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>,
 development@redaril.me
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, xu.yang_2@nxp.com
References: <20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me>
 <aqngNh-V7z3L2lP6@analog.com>
Content-Language: en-US
From: Fabio Forni <development@redaril.me>
In-Reply-To: <aqngNh-V7z3L2lP6@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> On Tue, Sep 15, 2026 at 09:35:21PM +0200, Fabio Forni via B4 Relay wrote:
>> @@ -821,23 +825,23 @@ static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mu
>>   }
>>   
>>   /**
>> - * devm_mux_state_get_from_np() - Get the mux-state for a device, with resource
>> + * devm_mux_state_get_from_swnode() - Get the mux-state for a device, with resource
>>    *				  management.
>>    * @dev: The device that needs a mux-control.
>>    * @mux_name: The name identifying the mux-control.
>> - * @np: the device nodes, use dev->of_node if it is NULL.
>> + * @node: the device nodes, use dev's fwnode if it is NULL.
>>    *
>>    * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
>>    *
>>    * The mux-state will automatically be freed on release.
>>    */
>>   struct mux_state *
>> -devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
>> -			   struct device_node *np)
>> +devm_mux_state_get_from_swnode(struct device *dev, const char *mux_name,
>> +			       struct fwnode_handle *node)
> 
> Shouldn't it be get_from_fwnode (not swnode)?

Yes, it's definitely a lapsus, good catch. I'll fix it.

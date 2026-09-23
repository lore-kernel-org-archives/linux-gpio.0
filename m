Received: from sender-op-o18.zoho.eu (sender-op-o18.zoho.eu [136.143.169.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A537AA91;
	Wed, 23 Sep 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198729; cv=pass; b=FUhKA2FLfa2xQoWWauGIa7up0saZ3wMNy7fNSXLyj17RIIBLcx4o0MXYtLCMX7hcHRXzk5Kcc68zl7Ntov3sUNXRansdSG2BTCqq5/PksqnNZP3xgyHHTf9hE7PqseqwAyup46m6gAb5VUWfq0O++q76NMQVxjyNsqpq62usCAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198729; c=relaxed/simple;
	bh=AaJhfsw9Q5rZd2xDpiu1UF7UEW0ob4rZnaf7FTuE1wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjxoSmDJfhIadk9r8aRjsqaILBtxQBDI6sAERD9HwRngZVQSMxNNXe+8cmVfTs3b8v3L43W1NiA/jS7iHUtyDoOCn4GsDnHOq+c98gkal2S+cqmxHQV4nps4lLRsv1TOYctTz0m6Idia7QZEOmHy0kvGuUCwVlH8HU9e0R0zfXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=YJyVXtYY; arc=pass smtp.client-ip=136.143.169.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="YJyVXtYY"
ARC-Seal: i=1; a=rsa-sha256; t=1790198701; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=fmFnlqCTC3dzyUMJkwZFRpmhlqQqPLmeasExd6JO1LrsQrZj1pdkz0h2oEAgvhjTHk8XQVK+h33iELp+3AkyXGPSGFq+LONOhUSkkLQ69jNtU9y+Hjk6MPKoiSm4Tad/3IyO71BDv24owlWX24at1nL+lW2DkIdAB0q9U9fCSlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1790198701; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YfdjJ0rk11gYXEa6XGABRPOuG2xuy/LGUQH80tEFqmQ=; 
	b=jnfLMNpM26ujWw8wS+BWyUkRNBjcf+jVcGM+GQmrhsXrx54HTZgmZfQVYinJxikBuMi3VGSwtff0DgWdN4YZLrrZzqyD6N3IN154CZgMNkK3gm1BAe3Au75CKkFCYN+XlP3KKkx7llp3t194RjV6j56zi+rs5cYceesoU7VvXl0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790198701;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YfdjJ0rk11gYXEa6XGABRPOuG2xuy/LGUQH80tEFqmQ=;
	b=YJyVXtYYN8htOAEEbZUBxtCM4ewlm1PPEt1mdS0m5MKtuVdoNnnhuRHACmpYamF4
	4iYKwWak8xuAzAA5rNQQNTdtRlyjmi0k3P3iIVYwU71qc8GP/NqtUM0IdVKuIrFfhC3
	+h5J6eXjhsLFVIzr8Hh6i4QPwvWlp+aSX8exvW8c=
Received: by smtp.zoho.eu with SMTPS id 1790198698612736.947832769049;
	Wed, 23 Sep 2026 23:24:58 +0200 (CEST)
Message-ID: <9161281d-20fb-4aea-aab9-d8c6948e4893@redaril.me>
Date: Wed, 23 Sep 2026 23:24:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mux: convert to use fwnode interface
To: development@redaril.me, Peter Rosin <peda@lysator.liu.se>,
 Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 xu.yang_2@nxp.com
References: <20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me>
Content-Language: en-US
From: Fabio <development@redaril.me>
In-Reply-To: <20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/09/26 19:26, Fabio Forni via B4 Relay wrote:
> From: Fabio Forni <development@redaril.me>
> 
> [snip]

Weekly ping. Has this patch gone unnoticed, or is there something wrong with it?
If the latter, I kindly ask what's wrong with it.

Regards,
Fabio.


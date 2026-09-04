Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B732E3CB2DB;
	Fri,  4 Sep 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512117; cv=none; b=fEH2ZGZY0nWh+QvKLslcx+MyeWzw3NNXeREpCktJY4H9FRHt4YoLbfLRTGWTJXTiKJGml0UBFgSEUYoGCpOOosjTTovE1qx1v0M+349OIeDDbxA1N+3k1RUn9LGxwmust2McSvblZHtp2G7wFSGfGvYNfqRkjRlforlzyXddi7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512117; c=relaxed/simple;
	bh=Tih92nE1gv13OWaEVgydm84hXf/AFX8Szi4Kca/cEHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCKj5AZuJaezf4TX34u+7CMfgiSI218Z+rnYsRyHDcbWhR5LJrYk0Hp2sep4Av35R0poMrzJDOYFLFQHGOashKE1a9CRGRbteTv052zObZyEtqZuLp8UGSjv3oad1LDWBCZxz4LKDlOGhfmYL62CENUCfnSGWOZkE/iTP2/sGKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fQPbyJ6D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fQPbyJ6D"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F177B1F42;
	Fri,  4 Sep 2026 10:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788512021;
	bh=Tih92nE1gv13OWaEVgydm84hXf/AFX8Szi4Kca/cEHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fQPbyJ6DOvgvv6s6fJN5UuGU2U4v/sHAc/3KzXl/lcaxf8PRNcktZM5KGF/Qwgb6T
	 x4IIFdu2mPacRjObJeaVQRe9pUrbAgKqbvnHe6sKZBRaobqH9AIaCmYDHe4w9bdv9o
	 93V2J7Ux5bHqtHrkybHrR5wGNTeI4vSrZBMlqJ44=
Message-ID: <a52efd67-13b2-4377-8fba-4523b4c9780f@ideasonboard.com>
Date: Fri, 4 Sep 2026 11:55:08 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: dumitru.ceclan@analog.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/08/2026 16:21, Dumitru Ceclan via B4 Relay wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
I had a quick test with this v16, and while cameras and serializer TPGs 
work, I still can't get anything from deser TPG. I'm trying to capture 
1920x1080-XRGB8888. There could be something wrong with the media config 
I do from the userspace, though.

Niklas, what settings you used with TPG on MAX96712?

  Tomi


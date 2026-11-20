Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158246;
	b=W1JYjepFc8iCBMnX9B3gf3NaIcuNMbTJJhlYFtiyFBI6BINTQyTHP30CUJgu1t1BfHIt
	 0Wyb0E6ZcF1htLDv6f7v7q55pL2qGJyBRf22R03i4YywFhlDwWmXoFF9JktPfCttrziCA
	 98IcqXnCBkF7kOc4SS9cIieNhy1m0bMDW8QTG8IwNM1IrkOPbyTPJJFAT/pJHl6rDkYtd
	 zcdYAM+kIXdIlzXX4mEiEZ0MgoikI3mZ3qRCusTnSaFEp1FaNxQXA3hGPAUKshxsSI2JZ
	 JYhHDnt0bJAkMQ/gr8bFuV264nSqmhVy9LQPWN4Ffgvy+dMnm8oPnHIm6f8xr1Z6A/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158246;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Date:From:To:CC:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-MTK;
	bh=iQd0szpodWCkedCEQ6y+wHscJHQCmXAqsdXrKfYkri4=;
	b=kFAh8lGgAm0wYYJKJ/mcyERsk9QGAevmR7VQLiRYMiZV5Q3qQ89yVM9LY7KMD3BXVCIe
	 MTidupo1uzlxXFloBb9ryHuMjEATxXI3hRDtPIP9xE9L1xYSDG9623STNqlAx521i/ftZ
	 toqGSQF7OXnT5XdnJQFScFDyRDIApLq9GeQfzUq108rvuEAFBlKM4ahIo9vHfakc/10VS
	 N5du3OrCaHor6KIeRjXVAvQ4WCDA1iCzsE31UJyojdcPgR7Qe73w/pVrciVJ0qECfKLUe
	 32hTzBnIcqNR16EU1EhNuIwXi0kI+WoELdk6+G4ku0LoTfkYKShkcVPPn0itE+fJBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="L/emeiig";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29625606A320;
	Fri, 20 Nov 2026 07:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29625606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=L/emeiig
X-UUID: 8b3b7d6ae4b011f1b1788b6acf885367-20261120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=iQd0szpodWCkedCEQ6y+wHscJHQCmXAqsdXrKfYkri4=;
	b=L/emeiigxAoj+4EhZZagBCq/pLrb5vXDCa6wdSs+0qxytjfLcGy2+hErnIjaNdOKZnoH/kdzirt/CAb5bYqx/eTeQ7UAUbjW1saaDZwzgRVzBc/9YnKfap2VzMXv4LK95+l4hsh1vuRi/n5xdhwnNjAugiTOgPpBAVIK4BHhpyc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5c51ba4a-7192-4b52-bf66-73c1359d538f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3e4819f7-eb8c-45c4-ab5e-2cec3871e65a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|836|865|888|898,TC:-5,Content:0|1
	5|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8b3b7d6ae4b011f1b1788b6acf885367-20261120
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 694821014; Fri, 20 Nov 2026 15:03:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Fri, 20 Nov 2026 15:03:52 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 20 Nov 2026 15:03:52 +0800
Date: Fri, 20 Nov 2026 15:03:52 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
CC: <linusw@kernel.org>, <lorenzo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <brgl@kernel.org>,
	<naseefkm@gmail.com>, <benjamin.larsson@genexis.eu>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lei.dong@airoha.com>, <ansuelsmth@gmail.com>
Subject: Re: [PATCH 04/12] pinctrl: airoha: an7581: fix PHY LED GPIO group
 assignments
Message-ID: <av_w2OD7cYYWNYRS@mediatek.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-5-zhengping.zhang@airoha.com>
 <5e681d92-9772-42e3-aae8-47faacf6d850@iopsys.eu>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5e681d92-9772-42e3-aae8-47faacf6d850@iopsys.eu>
X-MTK: N

Hi Mikhail,

Thanks for checking this. Could you please share the version of the
7581 datasheet (sometimes also referred to as the Programming Guide)
you are referring to, and the relevant pin-function table? It appears
to differ from the pinctrl info available to me.

The GPIO lists the eight pads as follows. The key point is the mapping
between the mux bits and the GPIO pins.

GPIO    Function           IOMUX control signal    SCU register
------  -----------------  ---------------------  ----------------
GPIO33  LAN0 LED1           RG_GPIO_LAN0_LED1_MODE  0x1fa20214[4]
GPIO34  LAN1 LED1           RG_GPIO_LAN1_LED1_MODE  0x1fa20214[6]
GPIO35  LAN2 LED1           RG_GPIO_LAN2_LED1_MODE  0x1fa20214[8]
GPIO42  LAN3 LED1           RG_GPIO_LAN3_LED1_MODE  0x1fa20214[10]
GPIO43  LAN0 LED0           RG_GPIO_LAN0_LED0_MODE  0x1fa20214[3]
GPIO44  LAN1 LED0           RG_GPIO_LAN1_LED0_MODE  0x1fa20214[5]
GPIO45  LAN2 LED0           RG_GPIO_LAN2_LED0_MODE  0x1fa20214[7]
GPIO46  LAN3 LED0           RG_GPIO_LAN3_LED0_MODE  0x1fa20214[9]

On the AN7581 EVB, I tested the configuration assigning lan0_led0
through lan3_led0 to GPIO 43 to 46, respectively, and observed
working hardware-controlled LAN LEDS. Register readback during testing
showed:

  SCU 0x214: 0x000042a8
  SCU 0x22c: 0x00000000
  SCU 0x27c: 0x00043210

The LED-related bits set in 0x214 are bits 3, 5, 7 and 9, consistent
with the GPIO overview above.

Could this be a naming difference between the documents? the key
relationship is the GPIO pad controlled by each SCU mux bit,
together with its LED mapping register and PHY LED channel. The patch
aims to correct that relationship, rather than rename LED0 and LED1.

I would like to reconcile the documentation before deciding wheter
to retain or drop this patch.

Best Regards,
Zhengping

On Sun, Nov 15, 2026 at 05:02:12PM +0300, Mikhail Kshevetskiy wrote:
> according to an7581 datasheet
> * LED0 uses GPIO33-35 and GPIO42 * LED1 uses GPIO43-46 so patch is not
> needed
> 

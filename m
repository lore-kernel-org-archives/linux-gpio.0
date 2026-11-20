Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159175;
	b=ReeAQpjnn6wcttTGK5TBQkXiulSSGxAEoTI/stncGLKO8VFgXznAOEUj1QJikiJcTpA5
	 IrqjVKR7Gp18xd0JJ5WwaxcrEM3xgRNNc0YkQHRIYoVjBs0oLN48yg4FlXOJuEnV8i/YO
	 06moeEQC0GiXrok3RrZNRnDyVlEbbh7JiHEBCOPmUp6RsKsR/nP+dLvPvKsIA2sYaVkEE
	 QiDVKocEk+4kZ6OVv1d6KYjuGna49kRlbRepnUM1jgdrT5CgIs7xum/Q4BkOF26aaePOC
	 HsqCGwJs/Kdh4Yvr0fA+iUL6gw06kUnH80UutvsuMU3/sPGrMFZW3nwXwUYBlMobz9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159175;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-MTK;
	bh=bjcBK2Jp+j7uKnBDu+KecoXiIuvzpZoiWmlv9+9ycts=;
	b=L50sEFW4cRq+aFlYq+ddsHBhguUo86zjEiLi0BjE6HrbIkdwVoWBmDpFx3fKYYXi5yOr
	 iKax0U+Q95T4owSPQpDFCkhYD73V/Siei3dxIJxTkZa2B1UksR4rKRQ0I0XGq3f+uvrCt
	 +QRY/bhWrBeBLZIqxVLXDnQZ2iaPnfswgXkJIVwdPcbl/rHpbehbCaoOo/1mluGViiHjW
	 iiMFdzubvd/+m3/EdJKXUrbbqw6s/BpgTNEOET7OTswls92MTPjaqNO7bPgTdxPayYx0E
	 CQW+uG1feMdOLK/OPpZbXFKjj3HdIvvsMIIXThct+RuZVm7Lsao2XfLuNy1Bb4B/VYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=olkXP7aR;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AE606A325;
	Fri, 20 Nov 2026 07:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=olkXP7aR
X-UUID: b921e870e4b211f18dc8c9802ae25ab1-20261120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=bjcBK2Jp+j7uKnBDu+KecoXiIuvzpZoiWmlv9+9ycts=;
	b=olkXP7aRi6nhiVi343QgDDSd5rZDx4hE7yvhpFNHZfVTlC5gIc0mBrzYvJm5/l8bfrrenT/X+hg6jMDv11QlQMkdHtVqAuiBQwoFDIj5gYbbQ+K95VKLR9X9ilrgvzMaO6p4LWFuCT87r1tOe97Ir7/ZlBW6ey/fI1Fvjgv3xo4=;
X-CID-CACHE: Type:Local,Time:202611201519+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b7826b25-de42-483c-90f3-55af6eb006be,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:08c2d419-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|136|836|865|888|898,TC:-5,Content
	:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b921e870e4b211f18dc8c9802ae25ab1-20261120
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1536349714; Fri, 20 Nov 2026 15:19:28 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Fri, 20 Nov 2026 15:19:27 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 20 Nov 2026 15:19:27 +0800
Date: Fri, 20 Nov 2026 15:19:27 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
CC: <linusw@kernel.org>, <lorenzo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <brgl@kernel.org>,
	<naseefkm@gmail.com>, <benjamin.larsson@genexis.eu>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lei.dong@airoha.com>, <ansuelsmth@gmail.com>
Subject: Re: [PATCH 05/12] pinctrl: airoha: an7581: select force GPIO mode on
 GPIO requests
Message-ID: <av_0f3bRXyWTSUYy@mediatek.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-6-zhengping.zhang@airoha.com>
 <80e72b60-3128-4594-a4bf-bb184ffc754b@iopsys.eu>
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
In-Reply-To: <80e72b60-3128-4594-a4bf-bb184ffc754b@iopsys.eu>
X-MTK: N

Hi Mikhail,

Thanks for the suggestion. I agree that selecting GPIO mode by disabling
the relevant functions would be preferable to use the FORCE_GPIO
registers.

I plan to change the implementation as follows:

- Select GPIO mode by disabling the relevant alternate functions,
  without setting FORCE_GPIO. Reject requests that conflict with
  existing users.

- When selecting a peripheral function, clear FORCE_GPIO overrides
  where needed so that the peripheral can control the pad.

Would this approach address your concern? If it looks reasonable, I will
adopt it in v2 and validate.

Best Regards,
Zhengping

On Sun, Nov 15, 2026 at 05:21:15PM +0300, Mikhail Kshevetskiy wrote:
> I think it's better does not play with force gpio registers and just
> disable (if no conflicts) functions that put selected pin to non-gpio mode.

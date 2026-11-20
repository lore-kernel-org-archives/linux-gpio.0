Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156773;
	b=XRCF8zdPg2a0vAbEt0vb1F7Xanh8wTJ5G+4vE/w36h1JMGKt0XIzIAabORpY0uK7uDl8
	 t2ISF7SGg8sjujCY4/9nws8keCHrinGwXFr34cVCLzx0sQQRt0pZS+k/HpD4Pyg+nJHdb
	 KeyweJt4/JxLmfVl8cZS0E/lj1yC5ID+RuPqchLY1gBmsIbrw7DoUYRXjSAevxlqV0SAR
	 NVfCeeVpYEyKZKpZErJEiVUTxB8osJ1+lQImxk3x/zoGC9LxVjN+ENCvORW4JpTgwciCH
	 5lDDIXt44VLJcmleh1YpqkJkne49RnxdXpZsfMgEj1dN44feD3Zy3Hj9neBJIh1voxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156773;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Date:From:To:CC:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-MTK;
	bh=bM/x8mW1K8KY6JBLdtbGHOmsga/Cv/oa26lN+auSggw=;
	b=qp+MvhfchrGyZn4x2IADxX7LHoQ5+Hda3zYtw6eiMXrt5SY6NmDRCt3Pp2eApZ3Rl7ek
	 +dmjKCFugM4e0PQAaWzOA7p3x1WiyjhojwHhlVa7J9llnYdy+Lck0NmkZ/V2i4fW8v9rT
	 hCrPzTGdweBALpkJJYpO1yvCT9Ipn/97mpRIrCVQe0tlsNE+IAMaPihCObhSPB3zlij4q
	 Wg/VdVY2LXhz3cJTckK9JVSkGGUlX3KDPMRBZUQOzUdftyUDwTnfzL2b4VhSCwUmdsYel
	 gySSTxStMbKCtt9jMA4KuipxekPUF9zFm7r8l6Q6GV9tbX0OYZG0QoVytCdAWbuJe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=HZ1IwjqT;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBFB606A320;
	Fri, 20 Nov 2026 06:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEBFB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=HZ1IwjqT
X-UUID: 20cf9b1ce4ad11f18dc8c9802ae25ab1-20261120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=bM/x8mW1K8KY6JBLdtbGHOmsga/Cv/oa26lN+auSggw=;
	b=HZ1IwjqTTxYGMWsFFoLVY5ZWcxJeweUisOaNwGATZgm+J5dn13ifLMOJ0XS2Spv8Lt/DXvenDvrk7d97MZTH9lptGKTx9odBGWCgVe1+I2U8VVcCxzWIJa6SxjqnXimAj1/+v8PqfkydnbrD6Lf6wcbLEeeYejfQvLKQmZBfDrM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:3567d6ca-f02b-41f0-88be-6baf12db3c52,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:88da8d66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 20cf9b1ce4ad11f18dc8c9802ae25ab1-20261120
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1910565177; Fri, 20 Nov 2026 14:39:25 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Nov 2026 14:39:24 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 20 Nov 2026 14:39:24 +0800
Date: Fri, 20 Nov 2026 14:39:24 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: Linus Walleij <linusw@kernel.org>, Mikhail Kshevetskiy
	<mikhail.kshevetskiy@iopsys.eu>
CC: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, <lorenzo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <naseefkm@gmail.com>, <benjamin.larsson@genexis.eu>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lei.dong@airoha.com>, <ansuelsmth@gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: airoha: configure GPIO muxes explicitly
 and fix pad mappings
Message-ID: <av_rHJ5W-mq3UAZ3@mediatek.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
 <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
X-MTK: N

Hi Mikhail and Linux,

Thanks for the feedback. I investigated the formatting issues on my
side, but have not yet been able to reproduce the problem.

I sent this series using git-send-email 2.43.0, without manually
copying or pasting the patches into an email editor.

I also retrieved the series from lore using:

  b4 shazam 20261110094339.749110-1-zhengping.zhang@airoha.com

All 12 patches applied successfully on top of my local pinctrl/for-next
at bc843179e208a. I also checked the archived patch messages and found
no apparent encoding issues. I understand that these checks do not
rule out formatting problems in the copies you received.

Comparing the archived messages, I found that, for example, tabs are
preserved in the original patch 05/12 and in the quoted code in
Sashiko's reply:

Original:
https://lore.kernel.org/all/20261110094339.749110-6-zhengping.zhang@airoha.com/

Sashiko's reply:
https://lore.kernel.org/all/sashiko-outbox-206823@kernel.org/

However, the corresponding quoted code in Mikhail's reply has tabs
expanded to spaces:
https://lore.kernel.org/all/80e72b60-3128-4594-a4bf-bb184ffc754b@iopsys.eu/

I noticed that tabs are preserved in Mikhail's reply to Miquel's SPI
patch, so this does not appear to happen with every reply:
https://lore.kernel.org/all/37fc133b-a5f3-4b4d-ba2a-002239bbcebc@iopsys.eu/

Could you please share one affected incoming patch as a raw .eml
attachment, if possible? It would also help to know how you retrieved
or saved the patches, and wheter the formatting problems are visible
in the original message source. This would let me narrow down where
it changed.

Thanks for the suggestion to use b4. I will use it to manage subsequent
revisions, and will address the code review comments separately.

Thanks for your help tracking this down.

Best Regards,
Zhengping

On Wed, Nov 18, 2026 at 10:15:15PM +0100, Linus Walleij wrote:
> On Sun, Nov 15, 2026 at 3:10 PM Mikhail Kshevetskiy
> <mikhail.kshevetskiy@iopsys.eu> wrote:
> 
> > Hello Zhengping Zhang,
> >
> > Please fix your patches. Looks like you insert patches to the e-mail body,
> > thus your patches were converted to "mail encoding"
> > * tabs was replaced by spaces
> > * unchanged empty lines "<space>\n" were converted to just "\n"
> > * long lines were split with "=\n"
> > * "=" were replaced with "=3D"
> >
> > and so on. So please use "git send-email" for patch sending.
> 
> I agree, I can't work with this, maybe review a little.
> 
> If possible use the b4 tool to manage your patch set(s).
> 
> Yours,
> Linus Walleij

Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72A2EEE63;
	Wed, 12 Aug 2026 02:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500018; cv=none; b=EI51mcHwvYt4w5EaYhh9ja8L0PTc1rZLUospoLfCBFPIwy3GWLTWcE4zRr+rdExclvXiji5HC4F2CDTJkJW7rLwjJGANyzA4K5jRhD40Uy4XrkWOkQrWqhahIuadaZBrhI95q1ahsJKGUkTs6bk4P4sHieqpl0Du82AUhCxBtCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500018; c=relaxed/simple;
	bh=dNtJO39o96/YdSUNdv8jQVnXMvLqughenPaQg22xQjQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P2YEnBu/p7+vQer/WBu8Fv9m8AgJPvLriQJ+1Jq3eoCkCr/Q3LkJfgR73xhW49u7bm4lbpCRMuA1Gp4fbVFnJGQkP2taC4BDqWVOURzj4VVxBpGayqeI2Z6HOwQC5+xc8cGgqrycpNqWpg8DdwTd2q8wAQXYWmPbwcyJ2edneVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=U92UbWSK; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="U92UbWSK"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C1xH1L13194414, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786499957; bh=Ly7V+HLOmpt1krXWs5pekyYKQV7pHZ0Cd9u5HrGrj3s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=U92UbWSKe6Hmwvbzfmrd0ZFeUTaqeLcFvgul84ANEPrLmZSO4kvaxLsVFnPIPHuCJ
	 9t4bVgMtnBgecHYGScjCNlhyqtuclQoIdLa4bGAd3IIZBTlGAvNXZUafyIIeSKp1n6
	 lgl6F988U2RhT9uD0y+58H5RrWsEHfLmmovdauwiI8l+esQSgIiqUss6TotP6sOo6Z
	 sOTSWBQRak4bMDM8hGRVkdn4cRVpj0NgdqjwagTzc4cYJnIhYeechh5KZTNALiRkKG
	 7n87Rn4Oz1wNYTO8a+0MyZ8IqEEy7iTnB64dj03JY5h00IVV5ZlWDw0uUl0cgzWloG
	 C8HydPy6N0/uw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C1xH1L13194414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 09:59:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tychang@realtek.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <james.tai@realtek.com>,
	<eleanor.lin@realtek.com>, <linux-realtek-soc@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<afaerber@suse.com>, <stanley_chang@realtek.com>, <cy.huang@realtek.com>
Subject: [PATCH 0/2] pinctrl: realtek: rtd1625: minor fix and cleanup
Date: Wed, 12 Aug 2026 09:59:13 +0800
Message-ID: <20260812015915.3477180-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series provides two minor updates for the Realtek RTD1625
pinctrl driver.

Yu-Chun Lin (2):
  pinctrl: realtek: rtd1625: fix base_bit for VE4 GPIO 13
  pinctrl: realtek: rtd1625: remove unused group name spdif_sel

 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


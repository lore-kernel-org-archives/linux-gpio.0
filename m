Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589412;
	b=VOxT5XJ0Qxag1UnmZ+ou9TaQA3f9CqOzrX01Y1G9uGFL9ifW+ZddWlinmWAZ6fuL17O6
	 aD0HFlYPBvDvvzZWASTOUQp3yTc1zcXvON7/It+MAmLfF/8SM4KM8UAQJxTSsDjYYkIic
	 i2q0cwVB/sU9Sf4f+KL2pFGqEQGKUijgjKMva9mbtMa2pBIvzdOT7UhKYp1Kgo3bpceMT
	 NqieLv3bZb5TUVW68uPsp1qxGUvNgnH0t5CdQAqs0uq3v18xP9Nlf8dVPtLr7OkGSFuTR
	 KFxZYH+teBX+QG5colvYx2CeXkuo4WIqgXjep4k+jU6hR7/G+pT4uyrXjqyC1mhzgjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589412;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Lh3fm0/0UUeE8v/7u7dxJVz5Pyfun/QiXrKMT9B1VcY=;
	b=AIcz9pe9Kb3iQ1M3sRt93DsONxKgdadWTe/hO7qIiaK/J0wy2EVEh5iRUYHFw+pFjUqv
	 lHiv+KBSED0KKVCQ87+0DbF48abdPvnWBCcvjtlCI1wWAL0mRVjDomAuLMDry20leRnua
	 zxMu5sf8I5Y1ZkeMJSbUVjhGKgthWfpimCFkdNNQ0sv9ReHDYwmRsc5Qebf+uDizE0hlA
	 weczHQWmwiO5McsMEfRRUt91pX5eqNdcJJ99GdaC5QANCEuOevWqiHdxt9OfEPXOJbsW1
	 IZtV00jOI8mHHYi54njLfuH4pk9vwdEFi7tTYRywLhvi9jO4pPeX7BbpJGy3szn8tmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CTiFbzyW;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=AO6wHWfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.172
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8032606A31E;
	Wed, 25 Nov 2026 06:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8032606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CTiFbzyW;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=AO6wHWfK
ARC-Seal: i=1; a=rsa-sha256; t=1795589388; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pYXqif4yQCbNLt3wfphhyKEYoBBRkwmB/KEtF5pX1lLgkNfyWBrZrDDxUY5TKOTsS/
    3AVxm28pXWL5ufeUAg4oxn4C8PIGIpgFa46zm62sv0mdEroqtrtdL9bOg0dujn6ocZpy
    +i4KR+ZrtxVoIo8TvAi3P2pdzX5W8s24g5HqFJ8/iyV0lzTOsjkp5xNjlFv2yqAGKPD2
    hYW9egKy/ed3yGZLcFl0EdnTfqFe5tw6QK8LeJmofjT06oVfEfuU+5zsaU0tKJMFqlpK
    dnS0U11wwjLHCF1E+3DHAtq76sxDLnKaYv6fTMje7ct7HMErEbjQEfUrGzTtkgfhFUIj
    nomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589388;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Lh3fm0/0UUeE8v/7u7dxJVz5Pyfun/QiXrKMT9B1VcY=;
    b=KfoHd9KRLnDfzmlsCbrNb6wATdVvVqyLCCeMqriri812DF72k4cqo+UYsmBIfbLl8r
    mVxqA3/H5WeiqtJa0S9uc31Yy6UxLwe6bqlRXB7LIZ0grumD5l7Fq2N+2v1POLvfMTvq
    paDnFBURbXGepcU5h0l1+g82j+sT5UrJwAwIJJJInbqmOBdZdqeGj2WXZc8Bdu3wpem4
    I7FC+wbs0NMt9Yq4Pt+m1Z6hfndrkhBltYm8dQGpzrfglcLeLsTsGio8vnVyD1Y+eDUe
    4vtxUT8HO9EG7p63SRBSFDkedXPur7QMuUF4Jghbt9RoORkXB+3xv1QVQwegJfcxXOcW
    aW/Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589388;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Lh3fm0/0UUeE8v/7u7dxJVz5Pyfun/QiXrKMT9B1VcY=;
    b=CTiFbzyWSTTTb6QQy8f9zLs+n8UztuCevT/eB/AHLqzdYeXDm51QpGm/ZNvdJVyqLc
    Azb3P/2xgZnymdQBACHHpsFD+aJr+J0gzA0Y8E/20N/Bo8Wdr7gwbl3XSUIKmVz3UpkX
    +7P0i+j8jcG7MUZo1sLcjtQERYIvFOCbJrZq9QnQI+oTULHhp/O5IYpjNkAhaUHuKMnl
    7eWLs7fXpx97rLadDJ19wRzLUg1+E6FbBAtbODWMwMjvH5mNKvnZBbTa4eEsieLR10n/
    TcjVgenwxE6//1Clf/p6qmov86hmLNvkfZ8cNNPHIG/cFzlDB/pHGDIAYn3jMaKM3Png
    M9Mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795589388;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Lh3fm0/0UUeE8v/7u7dxJVz5Pyfun/QiXrKMT9B1VcY=;
    b=AO6wHWfKxcF0hwvd/ZIMX5SyYna6XABqqsQrHAwWDthCL4zPL0x+B50Zgr1iKnfRZU
    Yh06ViE/n8M41Ijcy5BA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AP6nl5pv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 07:49:47 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/7] dt-bindings: pinctrl: ingenic: Add X2600 support
Date: Wed, 25 Nov 2026 07:49:39 +0100
Message-ID: <53973400fc3fb6373c6d1feaaa11ccbf961c34a7.1795589383.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795589383.git.hns@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Add the pinctrl and GPIO compatible strings for the Lumissil
X2600 SoC.

The X2600 has five GPIO ports with 32 GPIO number slots per port.
The programming manual lists 113 implemented GPIO pins.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes V5:
    - Restore Conor Dooley's Acked-by from v1 and v2,
      as requested by Rob Herring

 .../devicetree/bindings/pinctrl/ingenic,pinctrl.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 84e960255a36d..15966f6a79f15 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -19,10 +19,10 @@ description: >
   pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
   and PB31 is the last pin in GPIO port B. The JZ4730, the JZ4740, the JZ4725B,
   the X1000 and the X1830 contains 4 GPIO ports, PA to PD, for a total of 128
-  pins. The X2000 and the X2100 contains 5 GPIO ports, PA to PE, for a total of
-  160 pins. The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains
-  6 GPIO ports, PA to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO
-  ports, PA to PG, for a total of 224 pins.
+  pins. The X2000, the X2100 and the X2600 contains 5 GPIO ports, PA to PE, for a
+  total of 160 GPIO numbering slots. The JZ4750, the JZ4755 the JZ4760, the JZ4770 and the JZ4780
+  contains 6 GPIO ports, PA to PF, for a total of 192 pins. The JZ4775 contains
+  7 GPIO ports, PA to PG, for a total of 224 pins.
 
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
@@ -46,6 +46,7 @@ properties:
           - ingenic,x1830-pinctrl
           - ingenic,x2000-pinctrl
           - ingenic,x2100-pinctrl
+          - ingenic,x2600-pinctrl
       - items:
           - const: ingenic,jz4760b-pinctrl
           - const: ingenic,jz4760-pinctrl
@@ -86,6 +87,7 @@ patternProperties:
           - ingenic,x1830-gpio
           - ingenic,x2000-gpio
           - ingenic,x2100-gpio
+          - ingenic,x2600-gpio
 
       reg:
         items:
-- 
2.56.0


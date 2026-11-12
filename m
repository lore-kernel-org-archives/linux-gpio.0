Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488785;
	b=P3SYqrKk1GxAQRaU/OIkBRLXcx5CDvvZkDgdKt2sqBMG92eT70B8Unh3ZgmofFBWKEVB
	 Lzx70b38heG7wb+C/lmES0tpV5L3ZI8qIs624dsZ/NmtLrqsv/ZF8KmNDd4enoxUxuEg+
	 z59X0QlhJQqkjkaP4CnzBjLvl/DrzeqHjfAG5HJ0Op/NvhbwEbYJCMVtcoSXu+yDL64Il
	 7YOotvAjFhPh4pP1ughR7cHiQh8GpZZXY7p5hDR5czbXAQ+LFOA3g/fHlYbPLYVHHiMaL
	 cwzL8DYYOaIEDGRAJJEp/vl7crBIv5KJ9mcdr66Rjj5z9Kbzjup6Qxf0SG9J/9jLx9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488785;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=305Jb+hKkztJ2anWbpO0/YZ7fs6ZQznyHqAx4GDMm/s=;
	b=R3D3i1xXWrA9dTshcldI6hJU6SaPfeU3riBUDNFgoSLuZWPiScGUlAJuePbWB62HBd2F
	 VmBvI5fuBxom7jl5J4dA+rNt4clM7uegbKVwdHHbp7+csmBFxL4JLMaWcAiXqzp4Zso3r
	 TphUHauZqbemM6C1D49jvVxRG5VmZwgtoPyiUbY7H1QRX36E8OAI0rIZrbuLydq2VWvJ2
	 Tiezqh46kQUM9X3tUUZvwj62+Ns92rpdJMFhksPOI7d32U3sFDUcCdHwAQ/8ZXSLH4ye+
	 C00kfB4ZW+jMV7ML/4ZZZOrt3ILZhXm4eI2iGwBFeK6lNK/AvwDLh3tt+3FXVtYbTtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=pn9mECPn;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C4606A32A
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 13:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2C4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=pn9mECPn
DKIM2-Signature:  i=1; m=1; t=1794488782;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
 d=gmx.net;
 s=s31663417:rsa-sha256:tEweBgNHSmKVxg0QWU1XsoW8zQVD
   ISZUATHgMRAirWpAfXvpVY63iOKqL2Q9/WukYX6Kbh8VbkChn6uyrpqmcEewuv4Am+xqf4tumAT
   NndeuOndz1o4A+YTToQIfivOlf/UukY3hab7KBCn0O75QQ7gaFqeM6bWpWn/sSLbGBNqoJmzkN3
   bTahiVIqTB49CsLqczFTqdNYCuDTF+kN5cpLvcBeGaMn5HoyuPc89HRi9iFMpNyIQVz/anTSFTN
   z3f1+1/IfI3CK7y9Gmv28ZCTooxGuMUjNf7NfawFLOeIT/drsY9VgmakT4y+cir9+KC6Ib8aFhT
   809Z7Opx3rTF4A==;
Message-Instance:  m=1;
 h=sha256:
   uAdaCHNteyi8sSkELmY+kiU+q5sJgPDJJ/N1Bnpn4po=:
   ZQ/EMH7oxMdByB8EKJ0VtAPZUVzNkDx7o9D7iuDNRe8=,
  sha512:
   ZHuRgrAA/IiLBVX/BNX9KAn4BN14tdpJH+JQzmfs0GXzrTbwVAIEG/BYySrQO+ECHAsaJBAwzzSDgbcee36X3Q==:
   Ib5m/kPt0p7ZRpN2N6uT3S+xIdErIIAo6eRkaAJFnkdEmCCE7QzNG4c3PKnCHroljTWQv8/yjB3/ZsdZVFBLQg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794488734; x=1795093534; i=wahrenst@gmx.net;
	bh=305Jb+hKkztJ2anWbpO0/YZ7fs6ZQznyHqAx4GDMm/s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pn9mECPnORdI4iUWjlnEpd4eOnj0QoW8GhDulaEZEBUHZwPISuXYTWQbhaouECPj
	 CmrShxGoRxYK3dtWChuAd9zKNUb8l7pGDavI36VxlQwRIB4wEESKD5493L5jaglvK
	 Fusvwn087XaDqcE9Xb6sz3KkGEr33u356M4jNAhMslN+UEbd5q6JdcKQIVVCsR/TC
	 jUwf9/FPkKB9mD/H3kk7mdk83GNLryFQ/yQXSZh5Zk1blG0K48uEc4ea9MPuRirM/
	 ZCrkXaxbouiPk7ENuzRaQU8W5kKnJUcgrDJeo4x9CsCgtPTnG1fasruoZ2jgOifE1
	 c2tdHBpWqXGp4OaoDQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72oB-1xORgP2J3f-007If3; Thu, 12
 Nov 2026 14:05:34 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2 2/6] dt-bindings: phy: ti,tcan104x-can: Document Microchip MCP2562
Date: Thu, 12 Nov 2026 14:05:01 +0100
Message-ID: <20261112130506.12823-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112130506.12823-1-wahrenst@gmx.net>
References: <20261112130506.12823-1-wahrenst@gmx.net>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kRecz27rAejTHnD1Gv/hcBe7MgfSRSH5Ajk5rfgQ6v5cxLl5auZ
 ywJnF6f6dLmEjCwn4UajCCAMPQbjodO4JXQeJGWzxci+w0zvdEkiiDPlj4SpGbTrXtFNtKg
 4O4U1Ha41U097/x0SO3FL3aX1ySJ3kUZZzQzxQd14MW/ErQlCnvn7HE0i8boqFZB5cbUkTi
 7XL0ciX5x2s6aprMClRvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zQPTN5nNz7s=;fEaNofBy3qu0Bi7EEtrHPPgh4UP
 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
 8aVMY=

The Microchip MCP2562 High-speed CAN transceiver with Sleep mode is
pin-compatible to the Microchip MCP2542.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
=2D--
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/=
Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index 1a0dc9bbe6c9..7c356435c03f 100644
=2D-- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - microchip,ata6561
               - microchip,mcp2542
+              - microchip,mcp2562
               - ti,tcan1051
           - const: ti,tcan1042
       - items:
=2D-=20
2.53.0


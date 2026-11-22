Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368956;
	b=i9W0r4u1nucf6QbCUI+sIe5DFKTv2griRdoFeHv0KNmv6bPqulSG6gQRcnWtiULIpy6a
	 okteR/DQ/g1/gDxc3hLYEa4EV6htS8aRgk0ik+6S5r+CbQ/H9HPx3y9Q8i4lGqwXzSbO+
	 //YrWEUVLLHzTc7gse7q5Rah/oh1kOQio9p9PT+X4jhkDn31rv1jZzb7JKESErrrJU+rs
	 a4SQZR4KU+MK3YtMfQh+LX8MJz44UzfwEqUnDe3b+PcKLmBm4asX0b0o50s+saxC8/KHX
	 O0H9nbYMUMSuh1oeTWKY88K6N0FZ0dnZf9VdmgtWC/fCDfba1jgIJIrrMIFEYQK1gJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
	b=H720JUtX1A16ySF+/wDJOHZEbxSlC4NIwQQng322kYcVKHLkaimyswEDYFxy4yVPS9YQ
	 /ck2GaHjubLG5ypeVo3aeH2ScKrQhhRGId83s+OJqGWHeLtVW7D3xwHaqb4gXcjHCroJ9
	 Ixc6x3X4X4ZIdBdktOAd1OLY8u6piHr+rGb0yTkf8FDYCxswQ3q0ia89HvPNREEJ0ST/n
	 rV0BMKjiV2O/b1aWRPlPfVYxDm/hQLqwM4qhLC8qb2FKxVaLEV7kXFTh6/UxdHT94IlDd
	 bFvNIyubAIaonE/AWJkSxyOHF/ZgttHxOHzlJ4XEunnhddGhG2ssFU+1nA556X5wQ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD1606A32C
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 17:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BD1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so3924455c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 09:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368955; x=1795973755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=CCy30Koj3yGMktI7EOf5/TKNz7iYG67TRpkRh4+WyGd767qqOqi2odsV0Kj9RgzdpR
         0MSArWOqWa+qgM+DG05fmhi9iCLdhsBgQjyWvfKvR6CvHw0Kw1swCXgJC/I/7YZCBFAx
         RZsTHUXrF++DcIHmfu48ehUSD7lTQd/teBhoG7/svuDH6wVGUUZoRzezr2+ICHNgB+xA
         7B5kvhbXX+rswGCJVvdZwKkoJksBx01YiTcQfMMqQbNarj8hGRVzKxYKOSZ4BfgjxYel
         89B5N+j/zhAHZO5DrKcXigl4LPA6/fMZ8gt8HzA39nE2qNvNiOa8oD5wwUHgzPz4oTWv
         z3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368955; x=1795973755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=iNCtHOjr+FNnRQ3dNN2NR/E5vZkpJrZ4x+YYQNbYTp0beDf+bMsjYjZ4lkbDyRvLjS
         1wT7ibue2ESb8xYg1qGlQAN3quuHsqfOYwhjzi+Sh93HGvoUpE12oWlSHMjkByNMREU5
         UAA0xm0BEQ/X12zxTNQsd1US20icyXV5b5m/knjfwFzyCW1MfWLqkDcxCgi3GPDgSYx+
         zxRYD87chjcOYKdiXlCMFypFjhDxLjQRmgLhKmhDt7nfw4CFwqp4iPmlhD2lSt8js8i9
         8B3sNTnDdb7UTN+xOgPP66n5ji4ToFPBJaPTTd+Evx+ayb6Z8Owbp2ZWjFK6PE7lXIXy
         DP0Q==
X-Forwarded-Encrypted: i=1; AL+hErHMY0uVK9rhOrvD1OLhwcbBqPqgI9NENW01EqllEuYIWqZ2AExBwyJRI1s2XQnUG78GnHxOCukIQuWO@vger.kernel.org
X-Gm-Message-State: APuU4Z+at0C9Dhf543bgonoaRbTHH04sCMgObf1dnHDNnJWV5gYNvQep
	ZsPsbAEYlc7cIt7J+1RsOsY7ZBySCuU8I7/EzQ+iI1gzVGcGIhJr4VCB
X-Gm-Gg: AZFdTZelmA2m2GpW5+yxrF6LMI8HlJQK2b2nishFK4L8gb9fC1qeuPKV7m4X4h5cwkE
	jiEKsNh1gSNxbtFlarQ7nezUZdetlcfNiKULwXGlZQP1V5DajP/S0vbASPL/5vRVj9QLZIYvUe1
	/i9uUS3MdsFwzITKB6Oq7v4mMrtmkmFThAeI5Evp2F6F1/WzYV3bsv/k8XmJht5/3vfqZRhw4LF
	5C/lKEZgIh6cBrrETZRBk9eGkMjvnqIhmayRyGkuCXg2jX2og+qY54ic3qgnCXVP2remNgwn+FB
	BK4iznyIF60JqFDlv8DCn+5ZqMrKWh07X+RLrFP1mRtFzgahaNUhITb5WkEXmV4nj4W/pnlp5oJ
	E/1WHAyVuloPTAeZQCVavmcz0DwrD7I8rAdQoYuYrQv2563DLLPX2lmyMOZ/gHP51V2MxjVS/KE
	whqDcUU2EJCcHjjk2S6UDAolXoyGZTcoCvaZJOmKIYGzrLjk4eEaVjWT4Xx/6O+FW75a9Q69COl
	gTNEKEbz/6TNi9/Tjau2v2f5zMcJsa3W63xXVJ3ElJs2Dk8mbO0bjpdR2W1RPD2qiVBPuKXY58e
	BVvvxXRK7NyNWtTTbPX7soqiwGbHaZ3hGfA2RoPR/UNDVOZfw2yeqUNGW7LvKX/XQj+JfurhatW
	YP25FtDB9ZrCLNoosz+k3d4RCtD67eMLQ5beMLz1nvZ1ccOJrMoMZ35Mpqi7UiAVdD8VJeIb7hJ
	tuQVsVnfAtNaXFSul1iBekhIBuCA==
X-Received: by 2002:a05:701b:260e:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1b556900476mr10503800c88.36.1795368954863;
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 22 Nov 2026 23:04:50 +0530
Message-Id: <20261122173449.21009-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
-- 
2.34.1


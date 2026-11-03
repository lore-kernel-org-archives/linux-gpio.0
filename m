Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715436;
	b=ohYaJmkZVQF2KmxxdOaIgPqnfw2S5D+D+3zGpvXgYzLGdfpJfLnZjOmee5g7eDkaLpQc
	 aIQ/iGo/RSkzqa7vo7FdlvDNosC+GeRRQhIFtd/Q10Zn84gOEBKLGYrkYVN7yJZmJz5zY
	 TiOwiN8Ags/xg94eciQrVxPBsUUN+dTggEvmDbQsvJr/Vbi/C5rvEM5xJQsBuI/JPov7L
	 xxsQ9QKYaPuxBDMPQtcN/SnMP1ibnc/5SXzfQJeqm22aeTOiVJzgRT3X4NFriaYeVpRQL
	 nXEcRMzKihna4BB/arMHWJFksiCIvWBC99C10eKnGUuBZTnPOZfwSDD8XdMM6Dd0CBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ujLexze4oEmwt1yJ8uwee22/wDoFwxEzqjdWVDCUEGo=;
	b=UQ1Oxmj/XiQvmzbtjSBuYiCQPXws8tB++EfwnqR4csMVZvug1fSbCo2pD24DUb5b5UkY
	 ee007BibNfqGxbJ/tS6Uc2sqh0j7VPBmoK3Pfz9fPasydYcOQgIA7LolPlD0blXyC7PtD
	 2RbtVimRPkwOYGJktrX+YkybwJcsznOW4Jl4w3bNzLiKwnVBIaND+r4u9X6buSVqndGKo
	 I+1Uvl0lDoKkQrv8JW2o9LS1vy77LNaVJY+hnYC6pLRPtceFaFKTwRpW2RbAEVbLZ2s06
	 kF46FVrT+22+4VahuY5whbhnwNRKyQwsKFEdxQi7n2ey93yCKtESUF/CdUMa5OHQHZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ew9Mj5Rv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pxjp0ywz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F0606A324
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 14:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2F0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ew9Mj5Rv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pxjp0ywz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9w0U3079800
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 14:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujLexze4oEmwt1yJ8uwee22/wDoFwxEzqjdWVDCUEGo=; b=ew9Mj5RvFmGi8NRe
	gbgXjs8RXqB9HznKSLfSMK9Mvn4aqmO1qExseMLW4bnj0zR3R67mNslv9jybntmy
	xGNIuLHy8kZweoLIcWIwQ8bzvmTXG8BvSSPIdJXv8mWta+Q2DG/4PcqbCatM2fXo
	HSLFsPSXEDhhCqln1mzOLXyG72TuVRjTOsvDM7o4xHW0+CgEHh5KVnv9+6x16qV/
	P90eLoTKPdYWs/T6bo7E2Zmh3X41Tr0dIi1GAYBsmSleGtWo1OPO/KhpoHnt5jdV
	CAL4QTtatDUn6mDs9XX1bbIdYJUarVaJivjmmZrAnV1ZO3QmuLwDPvZse7soYQQn
	acQWqQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0874461-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 14:17:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so840073137.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 06:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715434; x=1794320234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujLexze4oEmwt1yJ8uwee22/wDoFwxEzqjdWVDCUEGo=;
        b=Pxjp0ywzaq4mrB2SmWxrjRoC/0CBZEHd6epbfdXHN9DslEQqKgAtYOjm/X815FE5LW
         8yxtc4XiogRFPyeUYEgHmq9kT4iHJC9zci41GZWBKEw71vr5n6WRbri0fVDCQmHb6Yfx
         /TjMrvccA3rZVv2q+jmoRdA74Kv99zmWY9O+C6JqxxiracWsVViLKOjFjwQvzQ0Ctdfo
         l4jtPvUi06g067AF/O6vJICBwWSVBVkDr5si2u/c5UBACK4rB3nZyOn+YH9H0HDMeFHk
         wy3uyzYjmsGHzEJbG1YlqVdKBohQZ2GXHSd9a8J7tRQs+xjoRgSrhtAcmWLuDopVI9r2
         ycDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715434; x=1794320234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujLexze4oEmwt1yJ8uwee22/wDoFwxEzqjdWVDCUEGo=;
        b=A4H8I110JmmxCEUaMiimehH8k9hsbV5KLggrPJhOS8O4/njjWFO99fz5WOl3e6Hzkb
         cExzMIzppio0KUBTyqulHSjwNuhhyY/h9/rnIbpoMBcEOgOACChIcbdX3vCX5X3CENvB
         zIh+insJmU+skFhjyurNVSY9aGLGVDX8WmOriJgiU3SC63azIO7buIHhE7Lvy99r32DF
         aU+RahmXyEMJg4B/uRCdj4d5VtJIXMuipBfaAl4ckEsuZWfxcxcaZdf0v8FwMyr4XQn+
         HCfd7BH+LtyT7phXN7wC+HNxvZrYq4MBusTp62eGh9rApgR0zWPDYM5JM5s/esUT0wQF
         4K3w==
X-Gm-Message-State: APuU4Z99AIbozkqOxwK0Yyp1qo1m0MqU/c1Qn8ojqkKJTxBVss7QW+n8
	D50kpWp3Ld8U2eDR4THWOue+5JoEWDqdyVXyjPS+SddZvmmJKrCqMyjYUyQt3JfPIshMh5o0lUf
	Ew1jf5CWnNRuiO2yF/gQ5olt+odYt8AK3nSFgozYBH2ydpCqvrBi8RwdYDFbVOrP9
X-Gm-Gg: AYBFou0HNAfzdNeOqQW8eWbQkJt9SGOvuoaqRZyoVeZlQXAt80AB3QCSKHiiz42b3mv
	rQ9EVHztVSdFZuj0f84OF43QY/SUC0xdLeHEjzUcFtjLPENnJe4qvKpiRzEk26Zwy30E6GT8MAf
	4dPEXS8mqOGkCTwqM5gZ7+NnBHSFsSdZ17jio6Gxr3rcPsf3HwuyIpaQ8Ea2YY06YMJbx0qisaK
	NUSNxumTGPQ9Mt87FOUPfSXlQnexRKSBtzJDEG5RpzO+m7erqddCVcJKmjgf+5Mn4lFfAZ+xumI
	NIgtvGaL4Wb6jX5maDJw5bQlCkDtyJQbAKuMX/cR+wNPYL1uA0xukaizbAK88CWGLT7bEPtWZxp
	8WZpCquZN5Vh4lvbRUP/lRQXtAGys/46/V0vFvWiw2zS+tjdU5GlVAZtnMt2MQUTdbg+ctoIsXh
	CCZw==
X-Received: by 2002:a05:6102:4493:b0:7cb:bb33:8412 with SMTP id ada2fe7eead31-7d072552d95mr4450868137.10.1793715433880;
        Tue, 03 Nov 2026 06:17:13 -0800 (PST)
X-Received: by 2002:a05:6102:4493:b0:7cb:bb33:8412 with SMTP id ada2fe7eead31-7d072552d95mr4450854137.10.1793715433373;
        Tue, 03 Nov 2026 06:17:13 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm27034897f8f.26.2026.11.03.06.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:17:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:17:03 +0100
Subject: [PATCH libgpiod v2 3/4] tests: bash: allow '=' in line names in
 shunit2 helper
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpioctl-v2-3-1660aa3dbe5b@oss.qualcomm.com>
References: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
In-Reply-To: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Asu0awYyRW6sUUwVLbx9lwPwTr/lSWvmHT/oZTTEH4k=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eziSQEPcRYdf+E3BwApRNZu+7CiVgd/0Mn2X
 TJ/imu88byJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauns4gAKCRAFnS7L/zaE
 wzu2D/0XaFvyCZk7DCWzpafpmuonSbiL26otKYAkktq91fPraUOk5VLChC/+cHgxGUzzV4YfCM6
 WYzYUGNuwTKnMzI+TUKM+iM40P95nxmW42hZXWFI736rjwD64i5Ou8hTzY19kclJlcME+Utaz1B
 g6fcdxoyW8wHbM8tCWEJLMmWfSZdlTHcetSHHbx21sHg8zfDtIZiTwmOhsjX53N92Yh9uIGKCoY
 DHqNDZDSwGhiwnmzDhlWwD41/D26HUTIq4xQwLF+nQdtMVCr9FTeQZUgexhJrILyGVvaZdby2H3
 cuUbTGJffIJqrcaA3uVX0Hz0eQ0xrgpoB0mZVJI3EH8B3RSwpQUqQkV7pA3FUjxMCsZRhETA+6G
 H/GohOlFuarDYbcC6jxQMVtW4Yn57CXvniGU3ltlGhTqmpM9K7iwtyelOQV/nKHr3ieNhYBGZkB
 eQ7ghCdGMSwE1rZm+Hwt9LZZLpJcLrbncJfNYQBg6/NUhxmxqESHl0B2I6vEXuV1uSu6c/QnQw9
 NhnuIpIUQMi9K5qq/xrW1PupueHFJdXNoElLBZ1YTV+CKYpFNUOam9huKBGXtsuVh3FLowj2UZA
 6XTsgynRs3tESHwFZ//Gc8buKTXPiE5QKd3YTQC4PTyXYORL+HhYnRGNrY+M54ZHNLpL99mtLsi
 FClSZdYTyvreoOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX8NzC7kLEZp5I
 22fPilNRqvjOtYy3D9ciEUurlpS7+rnHxBsM8YDZnRCcm4mnXTC2BsJxIo1SoW3bFf2EVszE4lL
 C/73wEP/tnpziu0Lvzb8hQUVZ3zoUwg=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9ecea cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5cnOVGI8b9SoWDGm5I0A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX1F5ve3Yjxqpz
 67hlc94BcdF3y7z1BEskURnjiLUNaMRU4snNfYSzUMJv5gZDWLzP2rirM51Bzm5FY2IN9WjibXt
 fkOJTOcVn2R8DezMy/vYzizhYHMATpC3f+mEr+RiASrwAXSPsDjGO+VBD8qqFOEIY9rx2iKEzHn
 eyUHd5KiuO2i+rnLLxrYZ5wugyvvSRFwQk0Yr3hS3Gq45aHICm7vmohVhNoCA3iioQT3vjTXIVW
 QbdBmx0AwOaXOouFG9E7raQw3Hu/dFVWxSd7B1NpTjTR1PiVYxXGo+cAPXw4mtToGgCYAUQj6P/
 ka6VYoRCDOqF+5FV1vhuPgCK85PcMLqHGy3v0UJTFDcg1dHZKB9lSoHqncy/oLiAl+XBHVX8HlX
 whlTAqzvSmIvXd4189xumI3WsU9T18TL5wuLDtv0Ex4VFC0hd0TicUPfsBBNRRqpwqkx7b+H9w0
 FQF3yaVN+fSNV9Wki4Q==
X-Proofpoint-ORIG-GUID: vB7gtKEryTgDrcT7zdTVum2qKdmad4FB
X-Proofpoint-GUID: vB7gtKEryTgDrcT7zdTVum2qKdmad4FB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030056

gpiosim_chip() splits its arguments at '=' and only keeps the second
field, so line_name=2:a=b creates a line named 'a'. Tests cannot
create lines with an '=' in the name, which is what the line=value
parsing of the tools needs to be checked with.

Keep everything after the first '=' as the value.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tests/scripts/gpiod-bash-test-helper.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/scripts/gpiod-bash-test-helper.inc b/tests/scripts/gpiod-bash-test-helper.inc
index d3c5a75a5d46da38250e39a11af18d09ffaca123..6f36e0a0cdac9a51b4fc932a0c30817803e9214d 100644
--- a/tests/scripts/gpiod-bash-test-helper.inc
+++ b/tests/scripts/gpiod-bash-test-helper.inc
@@ -73,7 +73,7 @@ gpiosim_chip() {
 	do
 		local KEY VAL
 		KEY=$(echo "$ARG" | cut -d"=" -f1)
-		VAL=$(echo "$ARG" | cut -d"=" -f2)
+		VAL=$(echo "$ARG" | cut -d"=" -f2-)
 
 		if [ "$KEY" = "num_lines" ]
 		then

-- 
2.47.3


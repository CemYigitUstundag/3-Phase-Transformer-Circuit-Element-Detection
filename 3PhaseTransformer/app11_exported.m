classdef app11_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        CalculationTab                  matlab.ui.container.Tab
        pscEditField                    matlab.ui.control.NumericEditField
        pscEditFieldLabel               matlab.ui.control.Label
        vscEditField                    matlab.ui.control.NumericEditField
        vscEditFieldLabel               matlab.ui.control.Label
        iscEditField                    matlab.ui.control.NumericEditField
        iscEditFieldLabel               matlab.ui.control.Label
        pocEditField                    matlab.ui.control.NumericEditField
        pocEditFieldLabel               matlab.ui.control.Label
        vocEditField                    matlab.ui.control.NumericEditField
        vocEditFieldLabel               matlab.ui.control.Label
        iocEditField                    matlab.ui.control.NumericEditField
        iocEditFieldLabel               matlab.ui.control.Label
        Image2                          matlab.ui.control.Image
        V2VEditField                    matlab.ui.control.NumericEditField
        V2VEditFieldLabel               matlab.ui.control.Label
        V1VEditField                    matlab.ui.control.NumericEditField
        V1VEditFieldLabel               matlab.ui.control.Label
        CalculateButton                 matlab.ui.control.Button
        PowerFactorEditField            matlab.ui.control.NumericEditField
        PowerFactorEditFieldLabel       matlab.ui.control.Label
        ApparentPowerkvAEditField       matlab.ui.control.NumericEditField
        ApparentPowerkvAEditFieldLabel  matlab.ui.control.Label
        SHORTCIRCUITTESTLabel           matlab.ui.control.Label
        OPENCIRCUITTESTLabel            matlab.ui.control.Label
        PscWEditField                   matlab.ui.control.NumericEditField
        PscWEditFieldLabel              matlab.ui.control.Label
        IscAEditField                   matlab.ui.control.NumericEditField
        IscAEditFieldLabel              matlab.ui.control.Label
        VscVEditField                   matlab.ui.control.NumericEditField
        VscVEditFieldLabel              matlab.ui.control.Label
        PocWEditField                   matlab.ui.control.NumericEditField
        PocWEditFieldLabel              matlab.ui.control.Label
        IocAEditField                   matlab.ui.control.NumericEditField
        IocAEditFieldLabel              matlab.ui.control.Label
        VocVEditField                   matlab.ui.control.NumericEditField
        VocVEditFieldLabel              matlab.ui.control.Label
        Label                           matlab.ui.control.Label
        EquivalentCircuitTab            matlab.ui.container.Tab
        Label_2                         matlab.ui.control.Label
        OUTPUTSLabel                    matlab.ui.control.Label
        V1NoloadEditField               matlab.ui.control.NumericEditField
        V1NoloadEditFieldLabel          matlab.ui.control.Label
        V1LoadEditField                 matlab.ui.control.NumericEditField
        V1LoadEditFieldLabel            matlab.ui.control.Label
        FullLoadCurrentI2EditField      matlab.ui.control.NumericEditField
        FullLoadCurrentI2Label          matlab.ui.control.Label
        VoltageRegulationEditField_2    matlab.ui.control.NumericEditField
        VoltageRegulationEditField_2Label  matlab.ui.control.Label
        TurningRatioEditField_2         matlab.ui.control.NumericEditField
        TurningRatioEditField_2Label    matlab.ui.control.Label
        X2EditField                     matlab.ui.control.NumericEditField
        X2EditFieldLabel                matlab.ui.control.Label
        R2EditField                     matlab.ui.control.NumericEditField
        R2EditFieldLabel                matlab.ui.control.Label
        XMEditField                     matlab.ui.control.NumericEditField
        XMEditFieldLabel                matlab.ui.control.Label
        RCEditField                     matlab.ui.control.NumericEditField
        RCEditFieldLabel                matlab.ui.control.Label
        X1EditField                     matlab.ui.control.NumericEditField
        X1EditFieldLabel                matlab.ui.control.Label
        R1EditField                     matlab.ui.control.NumericEditField
        R1EditFieldLabel                matlab.ui.control.Label
        EQUIVALENTCIRCUITandPARAMETERSLabel  matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        ReadMeTab                       matlab.ui.container.Tab
        TextArea                        matlab.ui.control.TextArea
        Tree_3                          matlab.ui.container.CheckBoxTree
        Node_3                          matlab.ui.container.TreeNode
        V1Node                          matlab.ui.container.TreeNode
        V2Node                          matlab.ui.container.TreeNode
        ApparentPowerNode               matlab.ui.container.TreeNode
        PowerFactorNode                 matlab.ui.container.TreeNode
        Tree_2                          matlab.ui.container.CheckBoxTree
        Node_2                          matlab.ui.container.TreeNode
        VscNode                         matlab.ui.container.TreeNode
        IscNode                         matlab.ui.container.TreeNode
        PscNode                         matlab.ui.container.TreeNode
        Tree                            matlab.ui.container.CheckBoxTree
        Node                            matlab.ui.container.TreeNode
        VocNode                         matlab.ui.container.TreeNode
        IocNode                         matlab.ui.container.TreeNode
        PocNode                         matlab.ui.container.TreeNode
        NecessaryinstructionsfortheuseoftheapplicationLabel  matlab.ui.control.Label
    end

    
    properties (Access = public)
       

    end

    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)
            Voc = app.VocVEditField.Value;
            Ioc = app.IocAEditField.Value;
            Poc = app.PocWEditField.Value;
            Vsc = app.VscVEditField.Value;
            Isc = app.IscAEditField.Value;
            Psc = app.PscWEditField.Value;
            V1 = app.V1VEditField.Value;
            V2 = app.V2VEditField.Value;
            S2 = app.ApparentPowerkvAEditField.Value;
            powerfactor = app.PowerFactorEditField.Value;
            k = app.TurningRatioEditField_2.Value;
            app.vocEditField.Value = Voc;
            app.iocEditField.Value = Ioc;
            app.pocEditField.Value = Poc;
            app.vscEditField.Value = Vsc;
            app.iscEditField.Value = Isc;
            app.pscEditField.Value = Psc;

            %PART A
            vphoc = Voc/sqrt(3);
            pphoc = Poc/3;
            Zoc = vphoc/Ioc;
            fioc = acosd(pphoc/(vphoc*Ioc));
            Rc = Zoc*cosd(fioc);
            app.RCEditField.Value = Rc;
            Xm = Zoc*sind(fioc);
            app.XMEditField.Value = Xm;
            Iphsc = Isc/sqrt(3);
            pphsc = Psc/3;
            Zeq = Vsc/Iphsc;
            fisc = acosd(pphsc/(Vsc*Iphsc));
            Req = Zeq*cosd(fisc);
            Xeq = Zeq*sind(fisc);
            R1 = Req/2;
            app.R1EditField.Value = R1;
            R2 = Req/2;
            app.R2EditField.Value = R2;
            X1 = Xeq/2;
            app.X1EditField.Value = X1;
            X2 = Xeq/2;
            app.X2EditField.Value = X2;
            k = V1/(V2/sqrt(3));
            app.TurningRatioEditField_2.Value = k;

            %PART B
            noloadV1 = (V2/sqrt(3))*(k);
            app.V1NoloadEditField.Value = noloadV1;
            I2 = (S2*1000)/(sqrt(3)*Voc);
            fullloadcurrent = I2/k;
            app.FullLoadCurrentI2EditField.Value = fullloadcurrent;

            %Part C
            loadV1 = V1+(fullloadcurrent*Zeq);
            app.V1LoadEditField.Value = loadV1;
            Reg1 =(loadV1-noloadV1)/loadV1;
            Reg = Reg1*100;
            app.VoltageRegulationEditField_2.Value = Reg;

            
           % app.TabGroup.SelectedTab = app.EquivalentCircuitTab;

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 940 642];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.AutoResizeChildren = 'off';
            app.TabGroup.Position = [-7 0 952 643];

            % Create CalculationTab
            app.CalculationTab = uitab(app.TabGroup);
            app.CalculationTab.AutoResizeChildren = 'off';
            app.CalculationTab.Title = 'Calculation ';
            app.CalculationTab.BackgroundColor = [1 1 1];

            % Create Label
            app.Label = uilabel(app.CalculationTab);
            app.Label.BackgroundColor = [0 0 1];
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontName = 'Times New Roman';
            app.Label.FontSize = 16;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [1 1 1];
            app.Label.Position = [2 571 946 48];
            app.Label.Text = 'Using open circuit and short circuit test equivalent circuit parameters and voltage regulation calculation';

            % Create VocVEditFieldLabel
            app.VocVEditFieldLabel = uilabel(app.CalculationTab);
            app.VocVEditFieldLabel.HorizontalAlignment = 'center';
            app.VocVEditFieldLabel.FontName = 'Times New Roman';
            app.VocVEditFieldLabel.FontSize = 16;
            app.VocVEditFieldLabel.FontWeight = 'bold';
            app.VocVEditFieldLabel.Position = [18 483 53 22];
            app.VocVEditFieldLabel.Text = 'Voc(V)';

            % Create VocVEditField
            app.VocVEditField = uieditfield(app.CalculationTab, 'numeric');
            app.VocVEditField.HorizontalAlignment = 'center';
            app.VocVEditField.FontName = 'Times New Roman';
            app.VocVEditField.FontSize = 16;
            app.VocVEditField.FontWeight = 'bold';
            app.VocVEditField.Position = [83 483 102 22];

            % Create IocAEditFieldLabel
            app.IocAEditFieldLabel = uilabel(app.CalculationTab);
            app.IocAEditFieldLabel.HorizontalAlignment = 'center';
            app.IocAEditFieldLabel.FontName = 'Times New Roman';
            app.IocAEditFieldLabel.FontSize = 16;
            app.IocAEditFieldLabel.FontWeight = 'bold';
            app.IocAEditFieldLabel.Position = [18 442 49 22];
            app.IocAEditFieldLabel.Text = 'Ioc(A)';

            % Create IocAEditField
            app.IocAEditField = uieditfield(app.CalculationTab, 'numeric');
            app.IocAEditField.HorizontalAlignment = 'center';
            app.IocAEditField.FontName = 'Times New Roman';
            app.IocAEditField.FontSize = 16;
            app.IocAEditField.FontWeight = 'bold';
            app.IocAEditField.Position = [83 442 101 22];

            % Create PocWEditFieldLabel
            app.PocWEditFieldLabel = uilabel(app.CalculationTab);
            app.PocWEditFieldLabel.HorizontalAlignment = 'center';
            app.PocWEditFieldLabel.FontName = 'Times New Roman';
            app.PocWEditFieldLabel.FontSize = 16;
            app.PocWEditFieldLabel.FontWeight = 'bold';
            app.PocWEditFieldLabel.Position = [12 399 57 22];
            app.PocWEditFieldLabel.Text = 'Poc(W)';

            % Create PocWEditField
            app.PocWEditField = uieditfield(app.CalculationTab, 'numeric');
            app.PocWEditField.HorizontalAlignment = 'center';
            app.PocWEditField.FontName = 'Times New Roman';
            app.PocWEditField.FontSize = 16;
            app.PocWEditField.FontWeight = 'bold';
            app.PocWEditField.Position = [83 399 102 22];

            % Create VscVEditFieldLabel
            app.VscVEditFieldLabel = uilabel(app.CalculationTab);
            app.VscVEditFieldLabel.HorizontalAlignment = 'center';
            app.VscVEditFieldLabel.FontName = 'Times New Roman';
            app.VscVEditFieldLabel.FontSize = 16;
            app.VscVEditFieldLabel.FontWeight = 'bold';
            app.VscVEditFieldLabel.Position = [756 483 53 22];
            app.VscVEditFieldLabel.Text = 'Vsc(V)';

            % Create VscVEditField
            app.VscVEditField = uieditfield(app.CalculationTab, 'numeric');
            app.VscVEditField.HorizontalAlignment = 'center';
            app.VscVEditField.FontName = 'Times New Roman';
            app.VscVEditField.FontSize = 16;
            app.VscVEditField.FontWeight = 'bold';
            app.VscVEditField.Position = [821 483 101 22];

            % Create IscAEditFieldLabel
            app.IscAEditFieldLabel = uilabel(app.CalculationTab);
            app.IscAEditFieldLabel.HorizontalAlignment = 'center';
            app.IscAEditFieldLabel.FontName = 'Times New Roman';
            app.IscAEditFieldLabel.FontSize = 16;
            app.IscAEditFieldLabel.FontWeight = 'bold';
            app.IscAEditFieldLabel.Position = [757 442 47 22];
            app.IscAEditFieldLabel.Text = 'Isc(A)';

            % Create IscAEditField
            app.IscAEditField = uieditfield(app.CalculationTab, 'numeric');
            app.IscAEditField.HorizontalAlignment = 'center';
            app.IscAEditField.FontName = 'Times New Roman';
            app.IscAEditField.FontSize = 16;
            app.IscAEditField.FontWeight = 'bold';
            app.IscAEditField.Position = [821 442 102 22];

            % Create PscWEditFieldLabel
            app.PscWEditFieldLabel = uilabel(app.CalculationTab);
            app.PscWEditFieldLabel.HorizontalAlignment = 'center';
            app.PscWEditFieldLabel.FontName = 'Times New Roman';
            app.PscWEditFieldLabel.FontSize = 16;
            app.PscWEditFieldLabel.FontWeight = 'bold';
            app.PscWEditFieldLabel.Position = [753 399 55 22];
            app.PscWEditFieldLabel.Text = 'Psc(W)';

            % Create PscWEditField
            app.PscWEditField = uieditfield(app.CalculationTab, 'numeric');
            app.PscWEditField.HorizontalAlignment = 'center';
            app.PscWEditField.FontName = 'Times New Roman';
            app.PscWEditField.FontSize = 16;
            app.PscWEditField.FontWeight = 'bold';
            app.PscWEditField.Position = [820 399 104 22];

            % Create OPENCIRCUITTESTLabel
            app.OPENCIRCUITTESTLabel = uilabel(app.CalculationTab);
            app.OPENCIRCUITTESTLabel.FontName = 'Times New Roman';
            app.OPENCIRCUITTESTLabel.FontSize = 20;
            app.OPENCIRCUITTESTLabel.FontWeight = 'bold';
            app.OPENCIRCUITTESTLabel.FontColor = [1 0 0];
            app.OPENCIRCUITTESTLabel.Position = [12 523 209 25];
            app.OPENCIRCUITTESTLabel.Text = 'OPEN CIRCUIT TEST';

            % Create SHORTCIRCUITTESTLabel
            app.SHORTCIRCUITTESTLabel = uilabel(app.CalculationTab);
            app.SHORTCIRCUITTESTLabel.FontName = 'Times New Roman';
            app.SHORTCIRCUITTESTLabel.FontSize = 20;
            app.SHORTCIRCUITTESTLabel.FontWeight = 'bold';
            app.SHORTCIRCUITTESTLabel.FontColor = [1 0 0];
            app.SHORTCIRCUITTESTLabel.Position = [717 524 224 25];
            app.SHORTCIRCUITTESTLabel.Text = 'SHORT CIRCUIT TEST';

            % Create ApparentPowerkvAEditFieldLabel
            app.ApparentPowerkvAEditFieldLabel = uilabel(app.CalculationTab);
            app.ApparentPowerkvAEditFieldLabel.HorizontalAlignment = 'center';
            app.ApparentPowerkvAEditFieldLabel.FontName = 'Times New Roman';
            app.ApparentPowerkvAEditFieldLabel.FontSize = 16;
            app.ApparentPowerkvAEditFieldLabel.FontWeight = 'bold';
            app.ApparentPowerkvAEditFieldLabel.Position = [315 445 158 22];
            app.ApparentPowerkvAEditFieldLabel.Text = 'Apparent Power(kvA)';

            % Create ApparentPowerkvAEditField
            app.ApparentPowerkvAEditField = uieditfield(app.CalculationTab, 'numeric');
            app.ApparentPowerkvAEditField.HorizontalAlignment = 'center';
            app.ApparentPowerkvAEditField.FontName = 'Times New Roman';
            app.ApparentPowerkvAEditField.FontSize = 16;
            app.ApparentPowerkvAEditField.FontWeight = 'bold';
            app.ApparentPowerkvAEditField.Position = [478 440 129 22];

            % Create PowerFactorEditFieldLabel
            app.PowerFactorEditFieldLabel = uilabel(app.CalculationTab);
            app.PowerFactorEditFieldLabel.HorizontalAlignment = 'center';
            app.PowerFactorEditFieldLabel.FontName = 'Times New Roman';
            app.PowerFactorEditFieldLabel.FontSize = 16;
            app.PowerFactorEditFieldLabel.FontWeight = 'bold';
            app.PowerFactorEditFieldLabel.Position = [324 400 139 22];
            app.PowerFactorEditFieldLabel.Text = 'Power Factor';

            % Create PowerFactorEditField
            app.PowerFactorEditField = uieditfield(app.CalculationTab, 'numeric');
            app.PowerFactorEditField.HorizontalAlignment = 'center';
            app.PowerFactorEditField.FontName = 'Times New Roman';
            app.PowerFactorEditField.FontSize = 16;
            app.PowerFactorEditField.FontWeight = 'bold';
            app.PowerFactorEditField.Position = [478 398 129 22];

            % Create CalculateButton
            app.CalculateButton = uibutton(app.CalculationTab, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.BackgroundColor = [0 0 1];
            app.CalculateButton.FontName = 'Times New Roman';
            app.CalculateButton.FontSize = 16;
            app.CalculateButton.FontWeight = 'bold';
            app.CalculateButton.FontColor = [1 1 1];
            app.CalculateButton.Position = [391 344 140 26];
            app.CalculateButton.Text = 'Calculate';

            % Create V1VEditFieldLabel
            app.V1VEditFieldLabel = uilabel(app.CalculationTab);
            app.V1VEditFieldLabel.HorizontalAlignment = 'center';
            app.V1VEditFieldLabel.FontName = 'Times New Roman';
            app.V1VEditFieldLabel.FontSize = 16;
            app.V1VEditFieldLabel.FontWeight = 'bold';
            app.V1VEditFieldLabel.Position = [324 525 139 22];
            app.V1VEditFieldLabel.Text = 'V1(V)';

            % Create V1VEditField
            app.V1VEditField = uieditfield(app.CalculationTab, 'numeric');
            app.V1VEditField.ValueDisplayFormat = '%.0f';
            app.V1VEditField.HorizontalAlignment = 'center';
            app.V1VEditField.FontName = 'Times New Roman';
            app.V1VEditField.FontSize = 16;
            app.V1VEditField.FontWeight = 'bold';
            app.V1VEditField.Position = [478 524 129 22];

            % Create V2VEditFieldLabel
            app.V2VEditFieldLabel = uilabel(app.CalculationTab);
            app.V2VEditFieldLabel.HorizontalAlignment = 'center';
            app.V2VEditFieldLabel.FontName = 'Times New Roman';
            app.V2VEditFieldLabel.FontSize = 16;
            app.V2VEditFieldLabel.FontWeight = 'bold';
            app.V2VEditFieldLabel.Position = [324 484 139 22];
            app.V2VEditFieldLabel.Text = 'V2(V)';

            % Create V2VEditField
            app.V2VEditField = uieditfield(app.CalculationTab, 'numeric');
            app.V2VEditField.HorizontalAlignment = 'center';
            app.V2VEditField.FontName = 'Times New Roman';
            app.V2VEditField.FontSize = 16;
            app.V2VEditField.FontWeight = 'bold';
            app.V2VEditField.Position = [478 483 129 22];

            % Create Image2
            app.Image2 = uiimage(app.CalculationTab);
            app.Image2.Position = [8 1 940 337];
            app.Image2.ImageSource = 'tests.png';

            % Create iocEditFieldLabel
            app.iocEditFieldLabel = uilabel(app.CalculationTab);
            app.iocEditFieldLabel.HorizontalAlignment = 'right';
            app.iocEditFieldLabel.FontName = 'Times New Roman';
            app.iocEditFieldLabel.FontWeight = 'bold';
            app.iocEditFieldLabel.Visible = 'off';
            app.iocEditFieldLabel.Position = [146 183 25 22];
            app.iocEditFieldLabel.Text = 'ioc';

            % Create iocEditField
            app.iocEditField = uieditfield(app.CalculationTab, 'numeric');
            app.iocEditField.Editable = 'off';
            app.iocEditField.HorizontalAlignment = 'center';
            app.iocEditField.FontName = 'Times New Roman';
            app.iocEditField.FontWeight = 'bold';
            app.iocEditField.Position = [170 183 37 22];

            % Create vocEditFieldLabel
            app.vocEditFieldLabel = uilabel(app.CalculationTab);
            app.vocEditFieldLabel.HorizontalAlignment = 'right';
            app.vocEditFieldLabel.FontName = 'Times New Roman';
            app.vocEditFieldLabel.FontWeight = 'bold';
            app.vocEditFieldLabel.Visible = 'off';
            app.vocEditFieldLabel.Position = [194 214 25 22];
            app.vocEditFieldLabel.Text = 'voc';

            % Create vocEditField
            app.vocEditField = uieditfield(app.CalculationTab, 'numeric');
            app.vocEditField.Editable = 'off';
            app.vocEditField.HorizontalAlignment = 'center';
            app.vocEditField.FontName = 'Times New Roman';
            app.vocEditField.FontWeight = 'bold';
            app.vocEditField.Position = [230 214 35 22];

            % Create pocEditFieldLabel
            app.pocEditFieldLabel = uilabel(app.CalculationTab);
            app.pocEditFieldLabel.HorizontalAlignment = 'right';
            app.pocEditFieldLabel.Visible = 'off';
            app.pocEditFieldLabel.Position = [251 105 25 22];
            app.pocEditFieldLabel.Text = 'poc';

            % Create pocEditField
            app.pocEditField = uieditfield(app.CalculationTab, 'numeric');
            app.pocEditField.Editable = 'off';
            app.pocEditField.HorizontalAlignment = 'center';
            app.pocEditField.FontName = 'Times New Roman';
            app.pocEditField.FontWeight = 'bold';
            app.pocEditField.Position = [284 105 56 22];

            % Create iscEditFieldLabel
            app.iscEditFieldLabel = uilabel(app.CalculationTab);
            app.iscEditFieldLabel.HorizontalAlignment = 'right';
            app.iscEditFieldLabel.FontName = 'Times New Roman';
            app.iscEditFieldLabel.FontWeight = 'bold';
            app.iscEditFieldLabel.Visible = 'off';
            app.iscEditFieldLabel.Position = [605 183 25 22];
            app.iscEditFieldLabel.Text = 'isc';

            % Create iscEditField
            app.iscEditField = uieditfield(app.CalculationTab, 'numeric');
            app.iscEditField.Editable = 'off';
            app.iscEditField.HorizontalAlignment = 'center';
            app.iscEditField.FontName = 'Times New Roman';
            app.iscEditField.FontWeight = 'bold';
            app.iscEditField.Position = [631 183 37 22];

            % Create vscEditFieldLabel
            app.vscEditFieldLabel = uilabel(app.CalculationTab);
            app.vscEditFieldLabel.HorizontalAlignment = 'right';
            app.vscEditFieldLabel.FontName = 'Times New Roman';
            app.vscEditFieldLabel.FontWeight = 'bold';
            app.vscEditFieldLabel.Visible = 'off';
            app.vscEditFieldLabel.Position = [656 214 25 22];
            app.vscEditFieldLabel.Text = 'vsc';

            % Create vscEditField
            app.vscEditField = uieditfield(app.CalculationTab, 'numeric');
            app.vscEditField.Editable = 'off';
            app.vscEditField.HorizontalAlignment = 'center';
            app.vscEditField.FontName = 'Times New Roman';
            app.vscEditField.FontWeight = 'bold';
            app.vscEditField.Position = [681 214 37 22];

            % Create pscEditFieldLabel
            app.pscEditFieldLabel = uilabel(app.CalculationTab);
            app.pscEditFieldLabel.HorizontalAlignment = 'right';
            app.pscEditFieldLabel.Visible = 'off';
            app.pscEditFieldLabel.Position = [717 106 25 22];
            app.pscEditFieldLabel.Text = 'psc';

            % Create pscEditField
            app.pscEditField = uieditfield(app.CalculationTab, 'numeric');
            app.pscEditField.Editable = 'off';
            app.pscEditField.HorizontalAlignment = 'center';
            app.pscEditField.FontName = 'Times New Roman';
            app.pscEditField.FontWeight = 'bold';
            app.pscEditField.Position = [745 105 51 22];

            % Create EquivalentCircuitTab
            app.EquivalentCircuitTab = uitab(app.TabGroup);
            app.EquivalentCircuitTab.AutoResizeChildren = 'off';
            app.EquivalentCircuitTab.Title = 'Equivalent Circuit';

            % Create Image
            app.Image = uiimage(app.EquivalentCircuitTab);
            app.Image.Position = [-31 170 1013 394];
            app.Image.ImageSource = 'circuit.png';

            % Create EQUIVALENTCIRCUITandPARAMETERSLabel
            app.EQUIVALENTCIRCUITandPARAMETERSLabel = uilabel(app.EquivalentCircuitTab);
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.BackgroundColor = [0 0 1];
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.HorizontalAlignment = 'center';
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.FontName = 'Times New Roman';
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.FontSize = 18;
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.FontWeight = 'bold';
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.FontColor = [1 1 1];
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.Position = [2 563 946 56];
            app.EQUIVALENTCIRCUITandPARAMETERSLabel.Text = 'EQUIVALENT CIRCUIT and PARAMETERS';

            % Create R1EditFieldLabel
            app.R1EditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.R1EditFieldLabel.HorizontalAlignment = 'right';
            app.R1EditFieldLabel.Visible = 'off';
            app.R1EditFieldLabel.Position = [31 483 25 22];
            app.R1EditFieldLabel.Text = 'R1';

            % Create R1EditField
            app.R1EditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.R1EditField.Editable = 'off';
            app.R1EditField.Position = [71 483 100 22];

            % Create X1EditFieldLabel
            app.X1EditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.X1EditFieldLabel.HorizontalAlignment = 'right';
            app.X1EditFieldLabel.Visible = 'off';
            app.X1EditFieldLabel.Position = [196 483 25 22];
            app.X1EditFieldLabel.Text = 'X1';

            % Create X1EditField
            app.X1EditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.X1EditField.Editable = 'off';
            app.X1EditField.Position = [236 483 100 22];

            % Create RCEditFieldLabel
            app.RCEditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.RCEditFieldLabel.HorizontalAlignment = 'right';
            app.RCEditFieldLabel.Visible = 'off';
            app.RCEditFieldLabel.Position = [194 316 25 22];
            app.RCEditFieldLabel.Text = 'RC';

            % Create RCEditField
            app.RCEditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.RCEditField.Editable = 'off';
            app.RCEditField.Position = [234 316 100 22];

            % Create XMEditFieldLabel
            app.XMEditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.XMEditFieldLabel.HorizontalAlignment = 'right';
            app.XMEditFieldLabel.Visible = 'off';
            app.XMEditFieldLabel.Position = [535 316 25 22];
            app.XMEditFieldLabel.Text = 'XM';

            % Create XMEditField
            app.XMEditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.XMEditField.Editable = 'off';
            app.XMEditField.Position = [575 316 100 22];

            % Create R2EditFieldLabel
            app.R2EditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.R2EditFieldLabel.HorizontalAlignment = 'right';
            app.R2EditFieldLabel.Visible = 'off';
            app.R2EditFieldLabel.Position = [548 483 25 22];
            app.R2EditFieldLabel.Text = 'R2';

            % Create R2EditField
            app.R2EditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.R2EditField.Editable = 'off';
            app.R2EditField.Position = [588 483 100 22];

            % Create X2EditFieldLabel
            app.X2EditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.X2EditFieldLabel.HorizontalAlignment = 'right';
            app.X2EditFieldLabel.Visible = 'off';
            app.X2EditFieldLabel.Position = [724 483 25 22];
            app.X2EditFieldLabel.Text = 'X2';

            % Create X2EditField
            app.X2EditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.X2EditField.Editable = 'off';
            app.X2EditField.Position = [764 483 100 22];

            % Create TurningRatioEditField_2Label
            app.TurningRatioEditField_2Label = uilabel(app.EquivalentCircuitTab);
            app.TurningRatioEditField_2Label.HorizontalAlignment = 'center';
            app.TurningRatioEditField_2Label.FontName = 'Times New Roman';
            app.TurningRatioEditField_2Label.FontSize = 14;
            app.TurningRatioEditField_2Label.FontWeight = 'bold';
            app.TurningRatioEditField_2Label.Position = [30 127 154 22];
            app.TurningRatioEditField_2Label.Text = 'Turning Ratio';

            % Create TurningRatioEditField_2
            app.TurningRatioEditField_2 = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.TurningRatioEditField_2.Editable = 'off';
            app.TurningRatioEditField_2.HorizontalAlignment = 'center';
            app.TurningRatioEditField_2.FontWeight = 'bold';
            app.TurningRatioEditField_2.Position = [199 127 121 22];

            % Create VoltageRegulationEditField_2Label
            app.VoltageRegulationEditField_2Label = uilabel(app.EquivalentCircuitTab);
            app.VoltageRegulationEditField_2Label.HorizontalAlignment = 'right';
            app.VoltageRegulationEditField_2Label.FontName = 'Times New Roman';
            app.VoltageRegulationEditField_2Label.FontSize = 14;
            app.VoltageRegulationEditField_2Label.FontWeight = 'bold';
            app.VoltageRegulationEditField_2Label.Position = [330 25 154 22];
            app.VoltageRegulationEditField_2Label.Text = 'Voltage Regulation(%)';

            % Create VoltageRegulationEditField_2
            app.VoltageRegulationEditField_2 = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.VoltageRegulationEditField_2.Editable = 'off';
            app.VoltageRegulationEditField_2.HorizontalAlignment = 'center';
            app.VoltageRegulationEditField_2.FontName = 'Times New Roman';
            app.VoltageRegulationEditField_2.FontSize = 14;
            app.VoltageRegulationEditField_2.FontWeight = 'bold';
            app.VoltageRegulationEditField_2.Position = [499 25 120 22];

            % Create FullLoadCurrentI2Label
            app.FullLoadCurrentI2Label = uilabel(app.EquivalentCircuitTab);
            app.FullLoadCurrentI2Label.HorizontalAlignment = 'center';
            app.FullLoadCurrentI2Label.FontName = 'Times New Roman';
            app.FullLoadCurrentI2Label.FontSize = 14;
            app.FullLoadCurrentI2Label.FontWeight = 'bold';
            app.FullLoadCurrentI2Label.Position = [592 127 154 22];
            app.FullLoadCurrentI2Label.Text = 'Full Load Current (I2'')';

            % Create FullLoadCurrentI2EditField
            app.FullLoadCurrentI2EditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.FullLoadCurrentI2EditField.Editable = 'off';
            app.FullLoadCurrentI2EditField.HorizontalAlignment = 'center';
            app.FullLoadCurrentI2EditField.FontWeight = 'bold';
            app.FullLoadCurrentI2EditField.Position = [760 127 121 22];

            % Create V1LoadEditFieldLabel
            app.V1LoadEditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.V1LoadEditFieldLabel.HorizontalAlignment = 'center';
            app.V1LoadEditFieldLabel.FontName = 'Times New Roman';
            app.V1LoadEditFieldLabel.FontSize = 14;
            app.V1LoadEditFieldLabel.FontWeight = 'bold';
            app.V1LoadEditFieldLabel.Position = [592 75 154 22];
            app.V1LoadEditFieldLabel.Text = 'V1 Load';

            % Create V1LoadEditField
            app.V1LoadEditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.V1LoadEditField.ValueDisplayFormat = '%.0f';
            app.V1LoadEditField.Editable = 'off';
            app.V1LoadEditField.HorizontalAlignment = 'center';
            app.V1LoadEditField.FontWeight = 'bold';
            app.V1LoadEditField.Position = [760 75 121 22];

            % Create V1NoloadEditFieldLabel
            app.V1NoloadEditFieldLabel = uilabel(app.EquivalentCircuitTab);
            app.V1NoloadEditFieldLabel.HorizontalAlignment = 'center';
            app.V1NoloadEditFieldLabel.FontName = 'Times New Roman';
            app.V1NoloadEditFieldLabel.FontSize = 14;
            app.V1NoloadEditFieldLabel.FontWeight = 'bold';
            app.V1NoloadEditFieldLabel.Position = [31 75 154 22];
            app.V1NoloadEditFieldLabel.Text = 'V1 Noload';

            % Create V1NoloadEditField
            app.V1NoloadEditField = uieditfield(app.EquivalentCircuitTab, 'numeric');
            app.V1NoloadEditField.ValueDisplayFormat = '%.0f';
            app.V1NoloadEditField.Editable = 'off';
            app.V1NoloadEditField.HorizontalAlignment = 'center';
            app.V1NoloadEditField.FontWeight = 'bold';
            app.V1NoloadEditField.Position = [199 75 121 22];

            % Create OUTPUTSLabel
            app.OUTPUTSLabel = uilabel(app.EquivalentCircuitTab);
            app.OUTPUTSLabel.HorizontalAlignment = 'center';
            app.OUTPUTSLabel.FontName = 'Times New Roman';
            app.OUTPUTSLabel.FontSize = 18;
            app.OUTPUTSLabel.FontWeight = 'bold';
            app.OUTPUTSLabel.Position = [357 85 229 63];
            app.OUTPUTSLabel.Text = 'OUTPUTS';

            % Create Label_2
            app.Label_2 = uilabel(app.EquivalentCircuitTab);
            app.Label_2.BackgroundColor = [1 1 1];
            app.Label_2.Position = [684 336 83 84];
            app.Label_2.Text = '';

            % Create ReadMeTab
            app.ReadMeTab = uitab(app.TabGroup);
            app.ReadMeTab.Title = 'Read Me';

            % Create NecessaryinstructionsfortheuseoftheapplicationLabel
            app.NecessaryinstructionsfortheuseoftheapplicationLabel = uilabel(app.ReadMeTab);
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.BackgroundColor = [0 0 1];
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.HorizontalAlignment = 'center';
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.FontName = 'Times New Roman';
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.FontSize = 18;
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.FontWeight = 'bold';
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.FontColor = [1 1 1];
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.Position = [2 563 950 56];
            app.NecessaryinstructionsfortheuseoftheapplicationLabel.Text = 'Necessary instructions for the use of the application';

            % Create Tree
            app.Tree = uitree(app.ReadMeTab, 'checkbox');
            app.Tree.FontName = 'Times New Roman';
            app.Tree.FontSize = 15;
            app.Tree.FontWeight = 'bold';
            app.Tree.Position = [6 432 940 125];

            % Create Node
            app.Node = uitreenode(app.Tree);
            app.Node.Text = 'In the open circuit test part, enter the desired values to obtain the RC and XM circuit elements (parameters) in the equivalent circuit.';

            % Create VocNode
            app.VocNode = uitreenode(app.Node);
            app.VocNode.Text = 'Voc';

            % Create IocNode
            app.IocNode = uitreenode(app.Node);
            app.IocNode.Text = 'Ioc';

            % Create PocNode
            app.PocNode = uitreenode(app.Node);
            app.PocNode.Text = 'Poc';

            % Create Tree_2
            app.Tree_2 = uitree(app.ReadMeTab, 'checkbox');
            app.Tree_2.FontName = 'Times New Roman';
            app.Tree_2.FontSize = 15;
            app.Tree_2.FontWeight = 'bold';
            app.Tree_2.Position = [7 297 940 125];

            % Create Node_2
            app.Node_2 = uitreenode(app.Tree_2);
            app.Node_2.Text = 'In the short circuit test part, enter the desired values to obtain the Req and Xeq circuit elements (parameters) in the equivalent circuit.';

            % Create VscNode
            app.VscNode = uitreenode(app.Node_2);
            app.VscNode.Text = 'Vsc';

            % Create IscNode
            app.IscNode = uitreenode(app.Node_2);
            app.IscNode.Text = 'Isc';

            % Create PscNode
            app.PscNode = uitreenode(app.Node_2);
            app.PscNode.Text = 'Psc';

            % Create Tree_3
            app.Tree_3 = uitree(app.ReadMeTab, 'checkbox');
            app.Tree_3.FontName = 'Times New Roman';
            app.Tree_3.FontSize = 15;
            app.Tree_3.FontWeight = 'bold';
            app.Tree_3.Position = [8 163 940 125];

            % Create Node_3
            app.Node_3 = uitreenode(app.Tree_3);
            app.Node_3.Text = 'For the necessary calculations, enter the input and output voltage values as well as the given power and power factor.';

            % Create V1Node
            app.V1Node = uitreenode(app.Node_3);
            app.V1Node.Text = 'V1';

            % Create V2Node
            app.V2Node = uitreenode(app.Node_3);
            app.V2Node.Text = 'V2';

            % Create ApparentPowerNode
            app.ApparentPowerNode = uitreenode(app.Node_3);
            app.ApparentPowerNode.Text = 'Apparent Power';

            % Create PowerFactorNode
            app.PowerFactorNode = uitreenode(app.Node_3);
            app.PowerFactorNode.Text = 'Power Factor';

            % Create TextArea
            app.TextArea = uitextarea(app.ReadMeTab);
            app.TextArea.FontName = 'Times New Roman';
            app.TextArea.FontSize = 15;
            app.TextArea.FontWeight = 'bold';
            app.TextArea.Position = [8 78 938 77];
            app.TextArea.Value = {'Depending on the entered input values, we can obtain our outputs such as turning ratio, full load current and equivalent parameter values and voltage regulation; At the same time, you need to click on the equivalent circuit section to see the voltage values in no load and full load states, respectively, which are needed for voltage regulation.'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app11_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end